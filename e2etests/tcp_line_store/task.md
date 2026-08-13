# 仓颉本机 TCP 行协议存储服务任务书

## 1. 目标

使用仓颉 1.0.5 实现一个只监听本机回环地址的 TCP 客户端/服务端。项目必须覆盖 `std.net`、`std.io`、并发、同步、超时和 `Resource` 关闭语义，并通过随任务提供的不可修改测试。

不得使用固定端口：服务端必须以端口 `0` 绑定，由操作系统分配空闲端口，再通过 `localAddress` 暴露实际端口。不得以 `sleep` 猜测服务端是否就绪。

## 2. 工程结构

```text
tcp_line_store/
├── cjpm.toml
└── src/
    ├── main.cj
    ├── line_store.cj
    └── tcp_line_store_test.cj   # 已给定，不可修改
```

`cjpm.toml`：

```toml
[package]
  cjc-version = "1.0.5"
  name = "tcp_line_store"
  version = "1.0.0"
  output-type = "executable"
```

## 3. 行协议

每条消息为一行 UTF-8 文本，以 `\n` 结束；行内容本身不得含 CR/LF。字段以 TAB 分隔，键和值不得含 TAB/CR/LF。协议如下：

| 请求 | 响应 | 语义 |
|---|---|---|
| `PING` | `PONG` | 存活检查 |
| `PUT\t<key>\t<value>` | `OK` | 新增或覆盖；允许空 value，不允许空 key |
| `GET\t<key>` | `VALUE\t<value>` 或 `MISSING` | 查询 |
| `DEL\t<key>` | `DELETED` 或 `MISSING` | 删除 |
| `SIZE` | `SIZE\t<n>` | 当前键数 |
| `QUIT` | `BYE` | 正常结束会话 |
| `HOLD` | 被释放后返回 `RELEASED` | 可确定性验证读超时的门控命令 |

未知单字段命令返回 `ERR\tunknown command`；其他非法格式返回 `ERR\tmalformed command`；空键返回 `ERR\tempty key`。

客户端/服务端须用 `StringReader<TcpSocket>` 与 `StringWriter<TcpSocket>` 读写，并在每次响应或请求后 `flush()`。服务端可并发处理多个连接，共享存储访问必须同步。

## 4. 公开 API

### 4.1 异常与编码

```cangjie
public class ProtocolException <: Exception {
    public init(message: String)
}

public class LineProtocol {
    public static func validate(line: String): Unit
    public static func encode(line: String): Array<Byte>
}
```

- `validate` 遇到 CR/LF 抛 `ProtocolException`，TAB 合法。
- `encode` 先验证，再返回 UTF-8 内容加一个 LF。

### 4.2 服务端

```cangjie
public class LocalStoreServer <: Resource {
    public let port: UInt16
    public init()
    public func serve(clientCount: Int64): Future<Unit>
    public func waitUntilHeld(): Unit
    public func releaseHeld(): Unit
    public func waitUntilHeldWritten(): Unit
    public func isClosed(): Bool
    public func close(): Unit
}
```

- 构造函数必须完成 `TcpServerSocket(bindAt: 0)` 与 `bind()`，所以返回后 `port` 已可连接。
- `serve(n)` 只允许调用一次，`n <= 0`、服务端已关闭或重复调用时抛 `ProtocolException`。它返回的 Future 在恰好处理完 `n` 个客户端后完成；各客户端要并发处理。
- `HOLD` 到达后，服务端调用 `waitUntilHeld()` 的线程才可返回；服务端必须等 `releaseHeld()` 后发送 `RELEASED`，发送并刷新后使 `waitUntilHeldWritten()` 返回。用 `SyncCounter` 或等价同步原语实现，不得轮询/sleep。
- 监听与已接受的连接均须设置有限超时。对端在自身读超时后立即关闭连接属于正常会话结束，服务端不得因此让 `serve` Future 失败。
- `close` 可重复调用。

### 4.3 客户端

```cangjie
public class LocalStoreClient <: Resource {
    public init(port: UInt16, timeout: Duration)
    public func request(line: String): String
    public func ping(): Bool
    public func put(key: String, value: String): Unit
    public func get(key: String): ?String
    public func delete(key: String): Bool
    public func size(): Int64
    public func hold(): String
    public func quit(): Unit
    public func isClosed(): Bool
    public func close(): Unit
}
```

- 仅连接 `127.0.0.1`；构造参数同时用于连接、读、写超时。
- `request` 写一行、刷新并读取一行；服务端提前关闭时抛 `ProtocolException`。底层读超时必须保留为 `SocketTimeoutException`。
- 字段不合法或响应不符合协议时抛 `ProtocolException`。
- `get`/`delete` 用 `Option`/`Bool` 表示缺失。

## 5. main 演示

启动一个只接收一个客户端的服务端，执行 PUT、PING、GET、SIZE、QUIT，等待服务 Future 完成并关闭资源。输出必须稳定为：

```text
ping=true, value=Cangjie, size=1
```

## 6. 测试与验收

将冻结的 `tcp_line_store_test.cj` 原样放入 `src/`。测试包含 26 个用例，覆盖临时端口、协议编码、CRUD、Unicode/空值、多客户端、门控读超时、异常与资源关闭。

最终依次执行：

```text
cjpm clean
cjpm build
cjpm test --no-color
cjpm run
```

四条命令均须成功，26/26 测试通过，编译器 warning 为 0。不得访问设计目录中的 oracle。

