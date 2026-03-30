# Unix Domain Socket 编程（std.net）

## 1. 概述

Unix Domain Socket（UDS）是基于文件路径的进程间通信机制，不经过网络栈，性能优于 TCP loopback。仓颉标准库在 `std.net` 中提供流式（`UnixServerSocket` + `UnixSocket`）和数据报式（`UnixDatagramSocket`）两种 UDS。

> **限制**：不支持 Windows 平台。Socket 路径最大 108 字节。使用后需手动 `remove(path)` 清理 socket 文件。

---

## 2. 流式 Unix Socket

### 2.1 UnixServerSocket API

| 方法/属性 | 签名 | 说明 |
|-----------|------|------|
| 构造 | `UnixServerSocket(bindAt: String)` | 指定 socket 文件路径 |
| `bind` | `bind(): Unit` | 绑定路径 |
| `accept` | `accept(): UnixSocket` | 阻塞等待连接 |
| `accept` | `accept(timeout: Duration): UnixSocket` | 带超时等待连接 |
| `close` | `close(): Unit` | 关闭监听 |
| `localAddress` | `prop localAddress: SocketAddress` | 本地地址 |

### 2.2 UnixSocket API

| 方法/属性 | 签名 | 说明 |
|-----------|------|------|
| 构造 | `UnixSocket(path: String)` | 指定 socket 文件路径 |
| `connect` | `connect(): Unit` | 建立连接 |
| `connect` | `connect(timeout: Duration): Unit` | 带超时连接 |
| `read` | `read(buf: Array<Byte>): Int64` | 读取数据 |
| `write` | `write(buf: Array<Byte>): Unit` | 写入数据 |
| `close` | `close(): Unit` | 关闭连接 |
| `readTimeout` | `mut prop readTimeout: ?Duration` | 读超时 |
| `writeTimeout` | `mut prop writeTimeout: ?Duration` | 写超时 |

---

## 3. 数据报式 Unix Socket

### 3.1 UnixDatagramSocket API

| 方法/属性 | 签名 | 说明 |
|-----------|------|------|
| 构造 | `UnixDatagramSocket(bindAt: String)` | 指定 socket 文件路径 |
| `bind` | `bind(): Unit` | 绑定路径 |
| `sendTo` | `sendTo(address: String, payload: Array<Byte>): Unit` | 发送到指定路径 |
| `receiveFrom` | `receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)` | 接收数据 |
| `connect` | `connect(path: String): Unit` | 锁定远端路径 |
| `send` | `send(data: Array<Byte>): Unit` | 发送到已连接路径 |
| `receive` | `receive(buffer: Array<Byte>): Int64` | 接收数据 |
| `disconnect` | `disconnect(): Unit` | 解除连接 |
| `close` | `close(): Unit` | 关闭 Socket |
| `receiveTimeout` | `mut prop receiveTimeout: ?Duration` | 接收超时 |
| `sendTimeout` | `mut prop sendTimeout: ?Duration` | 发送超时 |

---

## 4. 完整示例

### 4.1 流式 Unix Socket 通信

```cangjie
package test_proj
import std.net.*
import std.sync.*
import std.fs.*

let SOCKET_PATH = "/tmp/tmpsock"
let barrier = Barrier(2)

func runUnixServer() {
    try (serverSocket = UnixServerSocket(bindAt: SOCKET_PATH)) {
        serverSocket.bind()
        barrier.wait()

        try (client = serverSocket.accept()) {
            client.write("hello".toArray())
        }
    }
}

main(): Int64 {
    let fut = spawn {
        runUnixServer()
    }
    barrier.wait()
    try (socket = UnixSocket(SOCKET_PATH)) {
        socket.connect()

        let buf = Array<Byte>(5, repeat: 0)
        socket.read(buf)

        println(String.fromUtf8(buf)) // hello
    }
    fut.get()
    remove(SOCKET_PATH)
    return 0
}
```

### 4.2 数据报式 Unix Socket 通信

```cangjie
package test_proj
import std.net.*
import std.sync.*
import std.fs.*
import std.random.*
import std.env.*

let barrier = Barrier(2)

func createTempFile(): String {
    let tempDir: Path = getTempDirectory()

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

func runUnixDatagramServer(serverPath: String, clientPath: String) {
    try (serverSocket = UnixDatagramSocket(bindAt: serverPath)) {
        serverSocket.bind()
        barrier.wait()

        let buf = Array<Byte>(3, repeat: 0)

        let (clientAddr, read) = serverSocket.receiveFrom(buf)

        if (read == 3 && buf == [1, 2, 3]) {
            println("server received")
        }
        if (clientAddr.toString() == clientPath) {
            println("client address correct")
        }
    }
}

main(): Int64 {
    let clientPath = createTempFile()
    let serverPath = createTempFile()
    let fut = spawn {
        runUnixDatagramServer(serverPath, clientPath)
    }
    barrier.wait()

    try (unixSocket = UnixDatagramSocket(bindAt: clientPath)) {
        unixSocket.sendTimeout = Duration.second * 2
        unixSocket.bind()
        unixSocket.connect(serverPath)

        unixSocket.send([1, 2, 3])
    }

    fut.get()

    return 0
}
```

---

## 5. 关键规则

1. 使用 `try-with-resource` 自动清理 Socket 资源
2. 使用后必须手动 `remove(path)` 清理 socket 文件（`import std.fs.*`）
3. Socket 路径最大 108 字节
4. 不支持 Windows 平台
5. 数据报式 UDS 也支持 `connect()` + `send()`/`receive()` 简化模式
