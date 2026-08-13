<!-- cj-doc kind="example-leaf" level="4" id="examples.network.websocket-local-roundtrip" parent="examples.network" -->
# 完成本机 WebSocket 收发与关闭

[← HTTP、URL 与 WebSocket](index.md)

关闭发起方发送 Close 后读取确认；响应方回写收到的 Close payload；最后 `closeConn`，并显式管理阻塞读取和服务生命周期。

## 已验证的本机 WebSocket 往返

服务端用端口 `0` 避免固定端口冲突，以 `afterBind` 等待监听完成。关闭发起方发送 Close 后读取确认；响应方收到 Close 后回写相同 payload。`handlerDone` 与 `onShutdown` 分别确认连接处理器和服务端完全退出。

```cangjie cjtest=run id=stdx.websocket-local-roundtrip.run form=unit requires=stdx timeout=90s
package websocket_local_roundtrip

import std.sync.SyncCounter
import stdx.encoding.url.URL
import stdx.log.NoopLogger
import stdx.net.http.*

func verify(condition: Bool, label: String): Unit {
    if (!condition) {
        throw IllegalArgumentException("verification failed: ${label}")
    }
}

main(): Unit {
    let ready = SyncCounter(1)
    let handlerDone = SyncCounter(1)
    let stopped = SyncCounter(1)
    let logger = NoopLogger()
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .logger(logger)
        .build()

    server.distributor.register("/ws", {
        context =>
        let ws = WebSocket.upgradeFromServer(context)
        try {
            let request = ws.read()
            verify(request.frameType == TextWebFrame, "server text frame")
            verify(String.fromUtf8(request.payload) == "ping", "server payload")
            ws.write(TextWebFrame, "pong".toArray())
            ws.writeCloseFrame(status: 1000, reason: "done")
            verify(ws.read().frameType == CloseWebFrame, "server close reply")
        } finally {
            ws.closeConn()
            handlerDone.dec()
        }
    })
    server.afterBind({ => ready.dec() })
    server.onShutdown({ => stopped.dec() })
    spawn { server.serve() }
    ready.waitUntilZero()

    let client = ClientBuilder().noProxy().logger(logger).build()
    try {
        let (ws, _) = WebSocket.upgradeFromClient(
            client,
            URL.parse("ws://127.0.0.1:${server.port}/ws")
        )
        try {
            ws.write(TextWebFrame, "ping".toArray())
            let response = ws.read()
            verify(response.frameType == TextWebFrame, "client text frame")
            let text = String.fromUtf8(response.payload)
            let closeRequest = ws.read()
            verify(closeRequest.frameType == CloseWebFrame, "client close request")
            ws.write(CloseWebFrame, closeRequest.payload)
            println("message=ping|${text}")
        } finally {
            ws.closeConn()
        }
        handlerDone.waitUntilZero()
    } finally {
        client.close()
        server.closeGracefully()
        stopped.waitUntilZero()
    }
    println("shutdown=true")
}
```

预期标准输出：

```text cjtest=expect for=stdx.websocket-local-roundtrip.run stream=stdout match=exact
message=ping|pong
shutdown=true
```
