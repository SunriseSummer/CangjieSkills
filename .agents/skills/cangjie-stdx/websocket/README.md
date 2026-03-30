# 仓颉语言 WebSocket 编程（stdx.net.http）

## 1. 概述

- 依赖包 `stdx.net.http`，关于扩展标准库 `stdx` 的配置用法，请参阅 `cangjie-stdx` Skill
- WebSocket 协议通过 HTTP Upgrade 机制建立，支持 HTTP/1.1 和 HTTP/2.0 升级
- 帧类型枚举 `WebSocketFrameType`：
  - **数据帧**：`TextWebFrame`、`BinaryWebFrame`、`ContinuationWebFrame`
  - **控制帧**：`CloseWebFrame`、`PingWebFrame`、`PongWebFrame`
  - 其他：`UnknownWebFrame`
- 帧对象 `WebSocketFrame` 属性：`fin`（是否最后一帧）、`frameType`、`payload`

---

## 2. 服务端升级

```cangjie
package test_proj
import stdx.net.http.*
import std.collection.ArrayList
import std.sync.SyncCounter

main() {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    server.distributor.register("/ws", {
        ctx =>
        let ws = WebSocket.upgradeFromServer(
            ctx,
            subProtocols: ArrayList<String>(["proto1"]),
            userFunc: { req: HttpRequest =>
                let headers = HttpHeaders()
                headers.add("rsp", "ok")
                headers
            }
        )
        // 读取消息
        let frame = ws.read()
        println(String.fromUtf8(frame.payload))
        // 发送消息
        ws.write(TextWebFrame, "echo".toArray())
        // 关闭
        ws.writeCloseFrame(status: 1000)
        let _ = ws.read()  // 读取关闭响应
        ws.closeConn()
    })

    let ready = SyncCounter(1)
    server.afterBind({ => ready.dec() })
    spawn { server.serve() }
    ready.waitUntilZero()
    println("WebSocket server on port ${server.port}")
    server.close()
}
```

### 2.1 upgradeFromServer 签名

```
static func upgradeFromServer(
    ctx: HttpContext,
    subProtocols!: ArrayList<String> = ArrayList<String>(),
    origins!: ArrayList<String> = ArrayList<String>(),
    userFunc!: (HttpRequest) -> HttpHeaders = {_: HttpRequest => HttpHeaders()}
): WebSocket
```

- `subProtocols` — 支持的子协议列表，默认空（不支持子协议）
- `origins` — origin 白名单，默认空（接受所有 origin 的握手请求）
- `userFunc` — 自定义处理升级请求的函数，返回的 `HttpHeaders` 会通过 101 响应回给客户端

---

## 3. 客户端升级

```cangjie
import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*

main() {
    let client = ClientBuilder().build()
    let url = URL.parse("ws://127.0.0.1:8080/ws")
    let (ws, headers) = WebSocket.upgradeFromClient(
        client, url,
        subProtocols: ArrayList<String>(["proto1"]),
        headers: HttpHeaders()
    )

    // 发送
    ws.write(TextWebFrame, "hello".toArray())
    // 接收
    let frame = ws.read()
    println(String.fromUtf8(frame.payload))

    // 关闭流程：发送 CloseFrame → 读取 CloseFrame → 关闭底层连接
    ws.writeCloseFrame(status: 1000)
    let _ = ws.read()
    ws.closeConn()
    client.close()
}
```

### 3.1 upgradeFromClient 签名

```
static func upgradeFromClient(
    client: Client, url: URL,
    version!: Protocol = HTTP1_1,
    subProtocols!: ArrayList<String> = ArrayList<String>(),
    headers!: HttpHeaders = HttpHeaders()
): (WebSocket, HttpHeaders)
```

- URL scheme 应为 `ws` 或 `wss`（加密）
- 支持 HTTP/1.1 和 HTTP/2.0 向 WebSocket 升级
- 升级成功后可通过 `ws.subProtocol` 查看协商的子协议

---

## 4. WebSocket 读写 API

| 方法 | 签名 | 说明 |
|------|------|------|
| `read` | `read(): WebSocketFrame` | 读取一帧，阻塞 |
| `write` | `write(frameType: WebSocketFrameType, byteArray: Array<UInt8>, frameSize!: Int64 = 4096): Unit` | 发送帧 |
| `writeCloseFrame` | `writeCloseFrame(status!: ?UInt16 = None, reason!: String = ""): Unit` | 发送关闭帧 |
| `writePongFrame` | `writePongFrame(payload: Array<UInt8>): Unit` | 回复 Pong 帧 |
| `closeConn` | `closeConn(): Unit` | 关闭底层连接 |
| `subProtocol` | `subProtocol: ?String` | 协商的子协议 |

**write 规则说明：**
- 数据帧（Text/Binary）：如果 payload 大于 `frameSize`（默认 4096 bytes），会分段发送
- 控制帧（Close/Ping/Pong）：payload 不超过 125 bytes
- Close 帧发送后不能再发送数据帧
- Text 帧的 payload 需要是 UTF-8 编码

---

## 5. 消息接收循环（处理分片）

```cangjie
package test_proj
import stdx.net.http.*
import std.collection.ArrayList

// 在 WebSocket 连接建立后，用于接收可能分片的消息
func receiveMessage(ws: WebSocket): ArrayList<UInt8> {
    let data = ArrayList<UInt8>()
    var frame = ws.read()
    while (true) {
        match (frame.frameType) {
            case TextWebFrame | BinaryWebFrame =>
                data.add(all: frame.payload)
                if (frame.fin) { break }
            case ContinuationWebFrame =>
                data.add(all: frame.payload)
                if (frame.fin) { break }
            case CloseWebFrame =>
                ws.write(CloseWebFrame, frame.payload)
                break
            case PingWebFrame => ws.writePongFrame(frame.payload)
            case _ => ()
        }
        frame = ws.read()
    }
    return data
}

main() {
    println("receiveMessage function defined")
}
```

---

## 6. 异常类型

| 异常 | 说明 |
|------|------|
| `WebSocketException` | WebSocket 协议异常（收到不符合协议的帧、发送非法数据等） |
| `ConnectionException` | 对端已关闭连接 |
| `SocketException` | 底层连接错误 |

---

## 7. 关键规则速查

1. WebSocket 关闭需三步：`writeCloseFrame` → `read` 关闭响应 → `closeConn`
2. 大消息可能分片传输，需循环接收并检查 `frame.fin` 标志
3. 收到 `PingWebFrame` 应回复 `writePongFrame`
4. `subProtocols` 用于子协议协商
5. `origins` 参数可限制允许握手的 origin 来源
6. 控制帧（Close/Ping/Pong）的 payload 不能超过 125 bytes
7. Close 帧发送后禁止再发送数据帧
