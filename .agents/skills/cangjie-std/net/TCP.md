# TCP 编程（std.net）

## 1. 概述

TCP 是面向连接的可靠传输协议。仓颉标准库提供 `TcpServerSocket`（服务端监听）和 `TcpSocket`（客户端/连接端）两个核心类，均在 `std.net` 包中。

---

## 2. TcpServerSocket（服务端）

### 2.1 核心 API

| 方法/属性 | 签名 | 说明 |
|-----------|------|------|
| 构造 | `TcpServerSocket(bindAt: UInt16)` | 监听指定端口 |
| 构造 | `TcpServerSocket(bindAt: SocketAddress)` | 监听指定地址 |
| `bind` | `bind(): Unit` | 绑定端口，开始监听 |
| `accept` | `accept(): TcpSocket` | 阻塞等待连接 |
| `accept` | `accept(timeout: Duration): TcpSocket` | 带超时的等待连接 |
| `close` | `close(): Unit` | 关闭监听 |
| `localAddress` | `prop localAddress: SocketAddress` | 获取本地地址 |
| `reuseAddress` | `mut prop reuseAddress: Bool` | 地址复用（SO_REUSEADDR） |
| `reusePort` | `mut prop reusePort: Bool` | 端口复用（SO_REUSEPORT） |
| `backlogSize` | `mut prop backlogSize: Int64` | 等待连接队列大小 |
| `receiveBufferSize` | `mut prop receiveBufferSize: Int64` | 接收缓冲区大小 |
| `sendBufferSize` | `mut prop sendBufferSize: Int64` | 发送缓冲区大小 |

### 2.2 使用模式

```
TcpServerSocket(bindAt: port) → bind() → 循环 accept() → 处理连接 → close()
```

---

## 3. TcpSocket（客户端/连接端）

### 3.1 核心 API

| 方法/属性 | 签名 | 说明 |
|-----------|------|------|
| 构造 | `TcpSocket(address: String, port: UInt16)` | 指定地址和端口 |
| 构造 | `TcpSocket(address: SocketAddress)` | 指定 SocketAddress |
| `connect` | `connect(): Unit` | 建立连接 |
| `connect` | `connect(timeout: Duration): Unit` | 带超时连接 |
| `read` | `read(buf: Array<Byte>): Int64` | 读取数据 |
| `write` | `write(buf: Array<Byte>): Unit` | 写入数据 |
| `close` | `close(): Unit` | 关闭连接 |
| `localAddress` | `prop localAddress: SocketAddress` | 本地地址 |
| `remoteAddress` | `prop remoteAddress: SocketAddress` | 远端地址 |
| `isClosed` | `prop isClosed: Bool` | 是否已关闭 |

### 3.2 超时配置

| 属性 | 类型 | 说明 |
|------|------|------|
| `readTimeout` | `?Duration` | 读超时（超时抛 `SocketTimeoutException`） |
| `writeTimeout` | `?Duration` | 写超时 |

### 3.3 TCP 调优选项

| 属性 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `noDelay` | `Bool` | `true` | TCP_NODELAY，禁用 Nagle 算法，降低延迟 |
| `keepAlive` | `?SocketKeepAliveConfig` | `None` | TCP 保活配置 |
| `linger` | `?Duration` | `None` | SO_LINGER，关闭时等待数据发送 |
| `quickAcknowledge` | `Bool` | `false` | TCP_QUICKACK |
| `reuseAddress` | `Bool` | — | 地址复用 |
| `reusePort` | `Bool` | — | 端口复用 |
| `receiveBufferSize` | `Int64` | — | 接收缓冲区大小 |
| `sendBufferSize` | `Int64` | — | 发送缓冲区大小 |

`SocketKeepAliveConfig` 构造：
```
SocketKeepAliveConfig(interval: Duration, count: Int64)
```

---

## 4. 完整示例

### 4.1 基本 TCP 通信

```cangjie
package test_proj
import std.net.*
import std.sync.*

let SERVER_PORT: UInt16 = 33333
let syncCounter = SyncCounter(1)

func runTcpServer() {
    try (serverSocket = TcpServerSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()
        syncCounter.dec()

        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(10, repeat: 0)
            let count = client.read(buf)

            // Server read 3 bytes: [1, 2, 3, 0, 0, 0, 0, 0, 0, 0]
            println("Server read ${count} bytes: ${buf}")
        }
    }
}

main(): Int64 {
    let fut = spawn {
        runTcpServer()
    }
    syncCounter.waitUntilZero()

    try (socket = TcpSocket("127.0.0.1", SERVER_PORT)) {
        socket.connect()
        socket.write([1, 2, 3])
    }

    fut.get()

    return 0
}
```

### 4.2 Socket 选项配置

```cangjie
package test_proj
import std.net.*
import std.time.*

main() {
    try (tcpSocket = TcpSocket("127.0.0.1", 80)) {
        tcpSocket.readTimeout = Duration.second
        tcpSocket.noDelay = false
        tcpSocket.linger = Duration.minute

        tcpSocket.keepAlive = SocketKeepAliveConfig(
            interval: Duration.second * 7,
            count: 15
        )
    }
}
```

### 4.3 底层选项访问（extend）

```cangjie
package test_proj
import std.net.*

extend TcpSocket {
    public mut prop customNoDelay: Int64 {
        get() {
            Int64(getSocketOptionIntNative(OptionLevel.TCP, SocketOptions.TCP_NODELAY))
        }
        set(value) {
            setSocketOptionIntNative(OptionLevel.TCP, SocketOptions.TCP_NODELAY, IntNative(value))
        }
    }
}

main() {
    let socket = TcpSocket("127.0.0.1", 0)
    socket.customNoDelay = 1
    println(socket.customNoDelay)
}
```

---

## 5. 关键规则

1. 使用 `try-with-resource` 自动清理 Socket 资源
2. 服务端需先 `bind()` 后才能 `accept()`
3. 多线程场景用 `SyncCounter` 或 `Barrier` 保证服务端就绪后再连接
4. `noDelay` 默认 true（禁用 Nagle），适合低延迟场景
5. TLS 加密需先建 TCP 连接再创建 `TlsSocket`（详见 cangjie-stdx/tls）
