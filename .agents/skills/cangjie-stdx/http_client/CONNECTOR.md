# 自定义 TCP 连接（connector）

本文档详细介绍 HTTP 客户端的自定义 TCP 连接功能。核心 HTTP 客户端用法请参阅 [README.md](./README.md)。

---

## 1. connector() API

`ClientBuilder.connector()` 允许用户自定义 TCP 连接的创建方式，传入一个函数，接收 `SocketAddress` 参数，返回 `StreamingSocket`。

```
connector((SocketAddress) -> StreamingSocket): ClientBuilder
```

默认情况下，`Client` 内部自动创建 TCP 连接。使用 `connector()` 可以自定义连接行为，例如自定义 DNS 解析、使用特殊网络接口、或添加连接前后的自定义逻辑。

---

## 2. 完整示例：自定义 TCP Socket 连接器

以下示例展示如何使用自定义 `TcpSocket` 连接器配合 TLS 配置：

```cangjie
import std.net.{TcpSocket, SocketAddress}
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.net.http.*
import std.io.*

main() {
    // 配置 TLS（用户需提供 CA 证书文件）
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./ca.crt", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem))
    tlsConfig.alpnProtocolsList = ["h2"]

    // 自定义 TCP 连接器
    let tcpSocketConnector = {
        sa: SocketAddress =>
        let socket = TcpSocket(sa)
        socket.connect()
        return socket
    }

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .enablePush(false)
        .connector(tcpSocketConnector)
        .build()

    let rsp = client.get("https://example.com/hello")
    let buf = Array<UInt8>(1024, repeat: 0)
    let len = rsp.body.read(buf)
    println(String.fromUtf8(buf.slice(0, len)))

    client.close()
}
```

> **说明**：`ca.crt` 文件需由用户根据实际环境提供。此示例演示自定义连接器与 TLS 配合使用。

---

## 3. 使用场景

### 3.1 自定义 DNS 解析

通过自定义 connector，可以在连接前对目标地址进行自定义 DNS 解析：

```cangjie
import std.net.{TcpSocket, SocketAddress}
import stdx.net.http.*

main() {
    let customConnector = {
        sa: SocketAddress =>
        // 此处可替换为自定义 DNS 解析逻辑
        let socket = TcpSocket(sa)
        socket.connect()
        return socket
    }

    let client = ClientBuilder()
        .connector(customConnector)
        .build()

    let rsp = client.get("http://example.com/hello")
    println(rsp)

    client.close()
}
```

### 3.2 连接日志与监控

在连接创建前后添加自定义逻辑：

```cangjie
import std.net.{TcpSocket, SocketAddress}
import stdx.net.http.*

main() {
    let loggingConnector = {
        sa: SocketAddress =>
        println("Connecting to ${sa}")
        let socket = TcpSocket(sa)
        socket.connect()
        println("Connected to ${sa}")
        return socket
    }

    let client = ClientBuilder()
        .connector(loggingConnector)
        .build()

    let rsp = client.get("http://example.com/hello")
    println(rsp)

    client.close()
}
```

---

## 4. 速查

| 操作 | 用法 |
|------|------|
| 自定义连接器 | `ClientBuilder().connector(fn).build()` |
| 连接器签名 | `(SocketAddress) -> StreamingSocket` |
| 配合 TLS | `ClientBuilder().tlsConfig(tlsConfig).connector(fn).build()` |
