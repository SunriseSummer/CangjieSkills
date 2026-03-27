# 仓颉语言网络通信 Skill

## 1. TCP 通信

- 来自 `std.net.*`
- **TcpServerSocket**：服务端监听套接字，`bind()` 绑定端口，`accept()` 阻塞等待连接
- **TcpSocket**：客户端套接字，实现 `Resource & StreamingSocket`
- 使用 `try-with-resource` 自动关闭

| 类 / 方法 | 说明 |
|-----------|------|
| `TcpServerSocket(bindAt: UInt16)` | 创建服务端套接字 |
| `serverSocket.bind(): Unit` | 绑定到指定端口 |
| `serverSocket.accept(): StreamingSocket` | 接受连接，返回 `StreamingSocket` |
| `TcpSocket(address: String, port: UInt16)` | 创建客户端套接字 |
| `socket.connect(): Unit` | 建立连接 |
| `socket.read(buffer: Array<Byte>): Int64` | 读取数据到缓冲区，返回字节数 |
| `socket.write(payload: Array<Byte>): Unit` | 写入数据 |

```cangjie
package test_proj
import std.net.*
import std.sync.*

let SERVER_PORT: UInt16 = 33333
let syncCounter = SyncCounter(1)

// TCP 服务端：接受连接并读取数据
func runTcpServer() {
    try (serverSocket = TcpServerSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()
        syncCounter.dec()
        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(10, repeat: 0)
            let count = client.read(buf)
            println("Server read ${count} bytes: ${buf}")
        }
    }
}

main(): Int64 {
    let fut = spawn {
        runTcpServer()
    }
    syncCounter.waitUntilZero()
    // TCP 客户端：连接并发送数据
    try (socket = TcpSocket("127.0.0.1", SERVER_PORT)) {
        socket.connect()
        socket.write([1, 2, 3])
    }
    fut.get()
    return 0
}
```

---

## 2. UDP 通信

- **UdpSocket**：无连接数据报套接字，需 `bind()` 后使用
- `sendTo(address, data)` 发送数据报
- `receiveFrom(buf)` 返回 `(SocketAddress, Int64)` 元组

| 方法 | 说明 |
|------|------|
| `UdpSocket(bindAt: UInt16)` | 创建 UDP 套接字，端口 0 表示自动分配 |
| `udpSocket.bind(): Unit` | 绑定端口 |
| `udpSocket.sendTo(addr: SocketAddress, buffer: Array<Byte>): Unit` | 向目标地址发送数据 |
| `udpSocket.receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)` | 接收数据，返回 `(SocketAddress, Int64)` |

```cangjie
package test_proj
import std.net.*
import std.sync.*

let SERVER_PORT: UInt16 = 33334
let barrier = Barrier(2)

// UDP 服务端：接收数据报
func runUdpServer() {
    try (serverSocket = UdpSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()
        barrier.wait()
        let buf = Array<Byte>(3, repeat: 0)
        let (clientAddr, count) = serverSocket.receiveFrom(buf)
        println("Server received ${count} bytes: ${buf}")
    }
}

main(): Int64 {
    let fut = spawn { runUdpServer() }
    barrier.wait()
    // UDP 客户端：发送数据报
    try (udpSocket = UdpSocket(bindAt: 0)) {
        udpSocket.sendTimeout = Duration.second * 2
        udpSocket.bind()
        udpSocket.sendTo(IPSocketAddress("127.0.0.1", SERVER_PORT), [1, 2, 3])
    }
    fut.get()
    return 0
}
```

---

## 3. IP 地址

- `IPSocketAddress` 是带端口号的 IP 地址，用于 `sendTo` / `receiveFrom` 等方法
- `IPv4Address` / `IPv6Address` 用于表示纯 IP 地址

| 类型 | 说明 |
|------|------|
| `IPSocketAddress(host, port)` | IP 地址 + 端口，host 为字符串形式 |
| `IPv4Address` | IPv4 地址类型 |
| `IPv6Address` | IPv6 地址类型 |

---

## 4. Socket 选项

- 通过属性设置超时等选项，需在 `bind()` / `connect()` 之前或之后设置

| 属性 | 适用类型 | 说明 |
|------|---------|------|
| `sendTimeout` | TCP / UDP | 发送超时时间（`Duration` 类型） |
| `receiveTimeout` | TCP / UDP | 接收超时时间（`Duration` 类型） |

- 超时后抛出 `SocketTimeoutException`
- 使用 `Duration.second * n` 设置秒级超时

---

## 5. 异常类型

| 异常 | 说明 |
|------|------|
| `SocketException` | 通用套接字异常 |
| `SocketTimeoutException` | 超时异常 |

---

## 6. 关键规则速查

1. `TcpServerSocket` / `TcpSocket` / `UdpSocket` 均需 `bind()` 后使用
2. 套接字实现 `Resource`，使用 `try-with-resource` 自动关闭
3. `accept()` 返回的连接也需要 `try-with-resource` 管理
4. UDP 的 `receiveFrom` 返回 `(SocketAddress, Int64)` 元组
5. 多线程场景使用 `SyncCounter` 或 `Barrier` 保证服务端就绪后再连接
6. 设置 `sendTimeout` / `receiveTimeout` 避免无限阻塞
