# 仓颉语言 Socket 编程总览（std.net）

## 1. 概述

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

面向连接的可靠传输协议。核心类：`TcpServerSocket`（服务端监听）、`TcpSocket`（客户端/连接端）。

👉 详见 [TCP.md](./TCP.md)

---

## 3. UDP 编程

无连接的数据报协议。核心类：`UdpSocket`，支持 `sendTo`/`receiveFrom` 和可选的 `connect` 模式。

👉 详见 [UDP.md](./UDP.md)

---

## 4. Unix Domain Socket

基于文件路径的进程间通信，不经过网络栈。包括流式（`UnixServerSocket` + `UnixSocket`）和数据报式（`UnixDatagramSocket`）。

👉 详见 [UDS.md](./UDS.md)

---

## 5. Socket 选项

### 5.1 通用选项
| 属性 | 说明 |
|------|------|
| `readTimeout` / `writeTimeout` | 读写超时（`?Duration` 类型），超时抛 `SocketTimeoutException` |
| `receiveTimeout` / `sendTimeout` | UDP 收发超时（`?Duration` 类型） |
| `reuseAddress` / `reusePort` | 地址/端口复用 |
| `receiveBufferSize` / `sendBufferSize` | 收发缓冲区大小 |

### 5.2 TCP 专有
| 属性 | 说明 |
|------|------|
| `noDelay` | 禁用 Nagle 算法（默认 true，降低延迟） |
| `keepAlive` | `SocketKeepAliveConfig(interval: Duration, count: Int64)` — TCP 保活配置 |
| `linger` | `?Duration` — SO_LINGER，关闭时等待数据发送完毕 |
| `quickAcknowledge` | TCP_QUICKACK（默认 false） |

### 5.3 底层选项访问
- `getSocketOptionIntNative(level: Int32, name: Int32)` / `setSocketOptionIntNative(level: Int32, name: Int32, value: Int32)`
- `OptionLevel`：`TCP`、`SOCKET`、`IP` 等常量
- `SocketOptions`：`TCP_NODELAY`、`SO_KEEPALIVE`、`SO_REUSEADDR` 等常量

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

## 6. 异常类型

| 异常 | 说明 |
|------|------|
| `SocketException` | 通用 Socket 错误（继承 `IOException`） |
| `SocketTimeoutException` | Socket 操作超时（继承 `Exception`） |

---

## 7. 关键规则速查

1. 所有 Socket/Server 使用 `try-with-resource` 自动清理
2. TCP 服务端模式：`TcpServerSocket` → `bind()` → 循环 `accept()`，详见 [TCP.md](./TCP.md)
3. UDP 单包最大 64KB，详见 [UDP.md](./UDP.md)
4. TLS 需要先建立 TCP 连接，再在其上创建 `TlsSocket` 并 `handshake()`（详见 `cangjie-stdx` Skill）
5. `TcpSocket.noDelay` 默认为 true（禁用 Nagle 算法）
6. 多线程场景使用 `SyncCounter` 或 `Barrier` 保证服务端就绪后再连接
7. Unix Domain Socket 使用后需手动清理 socket 文件，详见 [UDS.md](./UDS.md)
