# UDP 编程（std.net）

## 1. 概述

UDP 是无连接的数据报协议。仓颉标准库提供 `UdpSocket` 类，支持发送和接收 UDP 数据报，在 `std.net` 包中。

---

## 2. UdpSocket API

### 2.1 核心方法

| 方法/属性 | 签名 | 说明 |
|-----------|------|------|
| 构造 | `UdpSocket(bindAt: UInt16)` | 绑定指定端口（0 = 随机端口） |
| 构造 | `UdpSocket(bindAt: SocketAddress)` | 绑定指定地址 |
| `bind` | `bind(): Unit` | 绑定端口 |
| `sendTo` | `sendTo(address: SocketAddress, payload: Array<Byte>): Unit` | 发送到指定地址 |
| `receiveFrom` | `receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)` | 接收数据（返回发送方地址和字节数） |
| `connect` | `connect(address: SocketAddress): Unit` | 锁定远端地址 |
| `send` | `send(data: Array<Byte>): Unit` | 发送到已连接地址 |
| `receive` | `receive(buffer: Array<Byte>): Int64` | 从已连接地址接收 |
| `disconnect` | `disconnect(): Unit` | 解除连接 |
| `close` | `close(): Unit` | 关闭 Socket |
| `localAddress` | `prop localAddress: SocketAddress` | 本地地址 |
| `remoteAddress` | `prop remoteAddress: SocketAddress` | 远端地址（已连接时） |

### 2.2 超时配置

| 属性 | 类型 | 说明 |
|------|------|------|
| `receiveTimeout` | `?Duration` | 接收超时 |
| `sendTimeout` | `?Duration` | 发送超时 |

### 2.3 其他选项

| 属性 | 说明 |
|------|------|
| `reuseAddress` | 地址复用 |
| `reusePort` | 端口复用 |
| `receiveBufferSize` | 接收缓冲区大小 |
| `sendBufferSize` | 发送缓冲区大小 |

---

## 3. 使用模式

### 3.1 无连接模式

```
UdpSocket(bindAt: port) → bind() → sendTo(addr, data) / receiveFrom(buf)
```

### 3.2 已连接模式

```
UdpSocket(bindAt: port) → bind() → connect(remoteAddr) → send(data) / receive(buf) → disconnect()
```

> **限制**：单个 UDP 数据包最大 64KB。

---

## 4. 完整示例

### 4.1 基本 UDP 通信

```cangjie
package test_proj
import std.net.*
import std.sync.*

let SERVER_PORT: UInt16 = 33334
let barrier = Barrier(2)

func runUdpServer() {
    try (serverSocket = UdpSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()
        barrier.wait()

        let buf = Array<Byte>(3, repeat: 0)

        let (clientAddr, count) = serverSocket.receiveFrom(buf)
        let sender = (clientAddr as IPSocketAddress)?.address.toString() ?? ""

        // Server receive 3 bytes: [1, 2, 3] from 127.0.0.1
        println("Server receive ${count} bytes: ${buf} from ${sender}")
    }
}

main(): Int64 {
    let fut = spawn {
        runUdpServer()
    }
    barrier.wait()

    try (udpSocket = UdpSocket(bindAt: 0)) { // random port
        udpSocket.sendTimeout = Duration.second * 2
        udpSocket.bind()
        udpSocket.sendTo(
            IPSocketAddress("127.0.0.1", SERVER_PORT),
            [1, 2, 3]
        )
    }

    fut.get()

    return 0
}
```

---

## 5. 关键规则

1. 使用 `try-with-resource` 自动清理
2. `bindAt: 0` 表示系统分配随机端口
3. 单个 UDP 包最大 64KB
4. `connect()` 后可用 `send()`/`receive()` 简化调用
5. `disconnect()` 可解除已连接状态
