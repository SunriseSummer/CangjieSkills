# 仓颉语言 Socket 编程（std.net）

## 1. 网络概述

### 1.1 分层
- **传输层**（`std.net` 包）：TCP（`TcpSocket`）、UDP（`UdpSocket`）、Unix Domain Socket（`UnixSocket`）
- **安全层**（`stdx.net.tls` 包）：TLS 1.2/1.3 加密传输（详见 `cangjie-stdx` Skill）

### 1.2 关键规则
- 网络操作在仓颉线程级别是**阻塞**的，但不阻塞 OS 线程（仓颉线程让出）
- 所有 Socket 均实现 `Resource`，可使用 `try-with-resource` 自动清理资源

### 1.3 类型层次
- `StreamingSocket <: IOStream & Resource`（面向流：`TcpSocket`、`UnixSocket`）
- `DatagramSocket <: Resource`（面向数据报：`UdpSocket`、`UnixDatagramSocket`）
- `ServerSocket <: Resource`（监听：`TcpServerSocket`、`UnixServerSocket`）

### 1.4 地址类型
- `SocketAddress`（抽象基类）→ `IPSocketAddress`（IP+端口）、`UnixSocketAddress`（文件路径）
- `IPAddress`（抽象）→ `IPv4Address`、`IPv6Address`
  - `IPAddress.parse(str)` / `IPAddress.tryParse(str)` — 解析地址
  - `IPAddress.resolve(hostname)` — DNS 解析
  - 常用判断：`isLoopback()`、`isPrivate()`、`isMulticast()`、`isGlobalUnicast()`、`isIPv4()`、`isIPv6()`
- `IPPrefix` — IP 子网，支持 `parse("192.168.1.0/24")`、`contains(addr)`、`broadcast()`

---

## 2. TCP 编程

### 2.1 服务端
- `TcpServerSocket(bindAt: UInt16)` 或 `TcpServerSocket(bindAt: SocketAddress)` → `bind()` → `accept()`（阻塞等待连接）
- `accept(timeout)` — 带超时的接受连接
- 属性：`backlogSize`、`reuseAddress`、`reusePort`、`receiveBufferSize`、`sendBufferSize`

### 2.2 客户端
- `TcpSocket(address: String, port: UInt16)` 或 `TcpSocket(address: SocketAddress)` → `connect()` → `read()`/`write()`
- `connect(timeout)` — 带超时连接
- 超时配置：`readTimeout`、`writeTimeout`（`?Duration` 类型）
- TCP 调优：`noDelay`（TCP_NODELAY，默认 true）、`keepAlive`（`?SocketKeepAliveConfig`）、`linger`（`?Duration`）

### 2.3 完整示例

```cangjie
package test_proj
import std.net.*
import std.sync.*

let SERVER_PORT: UInt16 = 33333
let syncCounter = SyncCounter(1)

func runTcpServer() {
    try (server = TcpServerSocket(bindAt: SERVER_PORT)) {
        server.bind()
        syncCounter.dec()
        try (client = server.accept()) {
            let buf = Array<Byte>(10, repeat: 0)
            let n = client.read(buf)
            println("Server read ${n} bytes: ${buf}")
        }
    }
}

main(): Int64 {
    let fut = spawn { runTcpServer() }
    syncCounter.waitUntilZero()

    try (socket = TcpSocket("127.0.0.1", SERVER_PORT)) {
        socket.connect()
        socket.write([1, 2, 3])
    }
    fut.get()
    return 0
}
```

---

## 3. UDP 编程

- `UdpSocket(bindAt: UInt16)` 或 `UdpSocket(bindAt: SocketAddress)` → `bind()`
- 发送：`sendTo(address: SocketAddress, payload: Array<Byte>)` 或连接后 `send(data)`
- 接收：`receiveFrom(buffer: Array<Byte>)` → `(SocketAddress, Int64)`，或连接后 `receive(buffer)`
- 可选 `connect(addr)` 锁定远端地址（之后可用 `send`/`receive`）
- `disconnect()` — 解除连接
- **限制**：单包最大 64KB
- 超时：`receiveTimeout`、`sendTimeout`（`?Duration` 类型）

```cangjie
package test_proj
import std.net.*
import std.sync.*

let SERVER_PORT: UInt16 = 33334
let barrier = Barrier(2)

func runUdpServer() {
    try (server = UdpSocket(bindAt: SERVER_PORT)) {
        server.bind()
        barrier.wait()
        let buf = Array<Byte>(3, repeat: 0)
        let (addr, n) = server.receiveFrom(buf)
        println("Received ${n} bytes from ${addr}: ${buf}")
    }
}

main(): Int64 {
    let fut = spawn { runUdpServer() }
    barrier.wait()

    try (sock = UdpSocket(bindAt: 0)) {
        sock.sendTimeout = Duration.second * 2
        sock.bind()
        sock.sendTo(IPSocketAddress("127.0.0.1", SERVER_PORT), [1, 2, 3])
    }
    fut.get()
    return 0
}
```

---

## 4. Socket 选项

### 4.1 通用选项
| 属性 | 说明 |
|------|------|
| `readTimeout` / `writeTimeout` | 读写超时（`?Duration` 类型），超时抛 `SocketTimeoutException` |
| `receiveTimeout` / `sendTimeout` | UDP 收发超时（`?Duration` 类型） |
| `reuseAddress` / `reusePort` | 地址/端口复用 |
| `receiveBufferSize` / `sendBufferSize` | 收发缓冲区大小 |

### 4.2 TCP 专有
| 属性 | 说明 |
|------|------|
| `noDelay` | 禁用 Nagle 算法（默认 true，降低延迟） |
| `keepAlive` | `SocketKeepAliveConfig(interval: Duration, count: Int64)` — TCP 保活配置 |
| `linger` | `?Duration` — SO_LINGER，关闭时等待数据发送完毕 |
| `quickAcknowledge` | TCP_QUICKACK（默认 false） |

### 4.3 底层选项访问
- `getSocketOptionIntNative(level: Int32, name: Int32)` / `setSocketOptionIntNative(level: Int32, name: Int32, value: Int32)`
- `OptionLevel`：`TCP`、`SOCKET`、`IP` 等常量
- `OptionName`：`TCP_NODELAY`、`SO_KEEPALIVE`、`SO_REUSEADDR` 等常量

```cangjie
package test_proj
import std.net.*

main() {
    try (sock = TcpSocket("127.0.0.1", 80)) {
        sock.readTimeout = Duration.second
        sock.noDelay = true
        sock.linger = Duration.minute
        sock.keepAlive = SocketKeepAliveConfig(
            interval: Duration.second * 7,
            count: 15
        )
    }
}
```

---

## 5. Unix Domain Socket

- 基于文件路径的进程间通信（IPC），不经过网络栈
- 路径最大 108 字节
- **不支持 Windows**
- 流式：`UnixServerSocket(bindAt: path)` + `UnixSocket(path)`
- 数据报式：`UnixDatagramSocket(bindAt: path)`
- 使用后需手动 `remove(path)` 清理 socket 文件

```cangjie
package test_proj
import std.net.*
import std.sync.*
import std.fs.*

let SOCK_PATH = "/tmp/cj_demo.sock"
let barrier = Barrier(2)

func runServer() {
    try (server = UnixServerSocket(bindAt: SOCK_PATH)) {
        server.bind()
        barrier.wait()
        try (client = server.accept()) {
            client.write("hello".toArray())
        }
    }
}

main(): Int64 {
    let fut = spawn { runServer() }
    barrier.wait()
    try (sock = UnixSocket(SOCK_PATH)) {
        sock.connect()
        let buf = Array<Byte>(5, repeat: 0)
        sock.read(buf)
        println(String.fromUtf8(buf))  // "hello"
    }
    fut.get()
    remove(SOCK_PATH)
    return 0
}
```

---

## 6. 异常类型

| 异常 | 说明 |
|------|------|
| `SocketException` | 通用 Socket 错误（继承 `IOException`） |
| `SocketTimeoutException` | Socket 操作超时（继承 `Exception`） |

---

## 7. 关键规则速查

1. 所有 Socket/Server 使用 `try-with-resource` 自动清理
2. TCP 服务端模式：`TcpServerSocket` → `bind()` → 循环 `accept()`
3. UDP 单包最大 64KB
4. TLS 需要先建立 TCP 连接，再在其上创建 `TlsSocket` 并 `handshake()`（详见 `cangjie-stdx` Skill）
5. `TcpSocket.noDelay` 默认为 true（禁用 Nagle 算法）
6. 多线程场景使用 `SyncCounter` 或 `Barrier` 保证服务端就绪后再连接
7. Unix Domain Socket 使用后需手动清理 socket 文件
