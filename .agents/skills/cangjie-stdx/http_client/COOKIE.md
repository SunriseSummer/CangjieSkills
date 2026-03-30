# Cookie 管理（stdx.net.http）

本文档详细介绍 HTTP 客户端的 Cookie 管理功能。核心 HTTP 客户端用法请参阅 [README.md](./README.md)。

---

## 1. 自动 Cookie 管理

`ClientBuilder` 默认启用 `CookieJar`，自动处理服务端返回的 `Set-Cookie` 头，并在后续请求中自动附带 `Cookie` 头。

```cangjie
import stdx.net.http.*

main() {
    // 默认启用 CookieJar，自动管理 Cookie
    let client = ClientBuilder().build()

    // 第一次请求：服务端可能返回 Set-Cookie
    let resp1 = client.get("http://example.com/login")
    println(resp1)

    // 第二次请求：客户端自动附带之前收到的 Cookie
    let resp2 = client.get("http://example.com/dashboard")
    println(resp2)

    client.close()
}
```

---

## 2. 禁用 Cookie

传 `None` 给 `cookieJar()` 可禁用自动 Cookie 管理：

```cangjie
import stdx.net.http.*

main() {
    let client = ClientBuilder().cookieJar(None).build()

    let resp = client.get("http://example.com/hello")
    println(resp)

    client.close()
}
```

---

## 3. Cookie 类

### 3.1 构造函数

```
Cookie(name: String, value: String,
    expires!: ?DateTime,     // 过期时间
    maxAge!: Int64,          // 过期秒数
    domain!: String,         // 域名
    path!: String,           // 路径
    secure!: Bool,           // 仅 HTTPS
    httpOnly!: Bool)         // 禁止 JS 访问
```

### 3.2 主要方法

| 方法 | 说明 |
|------|------|
| `toSetCookieString()` | 生成 `Set-Cookie` 头值（服务端用） |

---

## 4. CookieJar 方法

| 方法 | 签名 | 说明 |
|------|------|------|
| `toCookieString` | `toCookieString(cookies: ArrayList<Cookie>): String` | 将 Cookie 列表生成 `Cookie` 头值 |
| `parseSetCookieHeader` | `parseSetCookieHeader(resp: HttpResponse): ArrayList<Cookie>` | 解析响应中的 `Set-Cookie` 头，返回 Cookie 列表 |

---

## 5. 完整示例：Cookie 交互流程

以下示例展示了服务端设置 Cookie 和客户端发送 Cookie 的完整流程。示例使用本地 raw socket 模拟服务端，演示 Cookie 的设置与回传。

```cangjie
import std.net.{TcpServerSocket, TcpSocket, SocketAddress}
import std.io.*
import std.sync.*
import std.collection.ArrayList
import stdx.net.http.*

// 模拟服务端：返回 Set-Cookie 头
func startServer(barrier: AtomicBool): Unit {
    let serverSocket = TcpServerSocket(
        bindAt: SocketAddress("127.0.0.1", 0)
    )
    serverSocket.bind()
    let port = serverSocket.localAddress.port
    println("Server listening on port ${port}")
    barrier.store(true)

    // 处理第一个请求：返回 Set-Cookie
    let conn1 = serverSocket.accept()
    let buf1 = Array<UInt8>(4096, repeat: 0)
    conn1.read(buf1)
    let response1 = "HTTP/1.1 200 OK\r\nSet-Cookie: session=abc123; Path=/\r\nContent-Length: 2\r\n\r\nOK"
    conn1.write(response1.toArray())
    conn1.close()

    // 处理第二个请求：验证客户端发送了 Cookie
    let conn2 = serverSocket.accept()
    let buf2 = Array<UInt8>(4096, repeat: 0)
    let len2 = conn2.read(buf2)
    let request2 = String.fromUtf8(buf2.slice(0, len2))
    println("Server received: ${request2}")
    let response2 = "HTTP/1.1 200 OK\r\nContent-Length: 13\r\n\r\nCookie echoed"
    conn2.write(response2.toArray())
    conn2.close()

    serverSocket.close()
}

main() {
    let ready = AtomicBool(false)

    // 启动模拟服务端
    spawn { startServer(ready) }
    while (!ready.load()) {}

    // 创建客户端（默认启用 CookieJar）
    let client = ClientBuilder().build()

    // 第一次请求：服务端返回 Set-Cookie
    let resp1 = client.get("http://127.0.0.1:8080/login")
    println("First response: ${resp1.status}")

    // 第二次请求：客户端自动发送之前收到的 Cookie
    let resp2 = client.get("http://127.0.0.1:8080/dashboard")
    println("Second response: ${resp2.status}")

    client.close()
}
```

> **说明**：上述示例中的端口号需根据实际服务端绑定地址调整。此示例仅用于演示 Cookie 自动管理流程。

---

## 6. 手动解析和构造 Cookie

```cangjie
import stdx.net.http.*
import std.io.StringReader

main() {
    let client = ClientBuilder().build()

    let resp = client.get("http://example.com/login")

    // 手动解析响应中的 Set-Cookie 头
    let cookies = CookieJar.parseSetCookieHeader(resp)
    for (cookie in cookies) {
        println("Cookie: ${cookie.toSetCookieString()}")
    }

    // 将 Cookie 列表转为 Cookie 头值
    let cookieHeader = CookieJar.toCookieString(cookies)
    println("Cookie header: ${cookieHeader}")

    client.close()
}
```

---

## 7. 速查

| 操作 | 用法 |
|------|------|
| 启用 Cookie（默认） | `ClientBuilder().build()` |
| 禁用 Cookie | `ClientBuilder().cookieJar(None).build()` |
| 解析 Set-Cookie | `CookieJar.parseSetCookieHeader(resp)` |
| 生成 Cookie 头 | `CookieJar.toCookieString(cookies)` |
| 生成 Set-Cookie 值 | `cookie.toSetCookieString()` |
