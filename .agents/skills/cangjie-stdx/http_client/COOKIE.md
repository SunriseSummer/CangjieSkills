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
    expires!: ?DateTime = None,  // 过期时间
    maxAge!: ?Int64 = None,      // 过期秒数
    domain!: String = "",        // 域名
    path!: String = "",          // 路径
    secure!: Bool = false,       // 仅 HTTPS
    httpOnly!: Bool = false)     // 禁止 JS 访问
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
import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.time.*
import std.sync.*

main() {
    // 1、启动 socket 服务器
    let serverSocket = TcpServerSocket(bindAt: 0)
    serverSocket.bind()
    let fut = spawn {
        serverPacketCapture(serverSocket)
    }
    // 客户端一般从 response 中的 Set-Cookie header 中读取 cookie，并将其存入 cookieJar 中，
    // 下次发起 request 时，将其放在 request 的 Cookie header 中发送
    // 2、启动客户端
    let client = ClientBuilder().build()
    let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? throw Exception("Port not found.")
    let u = URL.parse("http://127.0.0.1:${port}/a/b/c")
    var r = HttpRequestBuilder().url(u).build()
    // 3、发送 request
    client.send(r)
    r = HttpRequestBuilder().url(u).build()
    // 4、发送新 request，从 CookieJar 中取出 cookie，并转成 Cookie header 中的值
    // 此时 cookie 2=2 已经过期，因此只发送 1=1 cookie
    client.send(r)
    // 5、关闭客户端
    client.close()
    fut.get()
    serverSocket.close()
}

func serverPacketCapture(serverSocket: TcpServerSocket) {
    let server = serverSocket.accept()
    let buf = Array<UInt8>(500, repeat: 0)
    var i = server.read(buf)
    println(String.fromUtf8(buf[..i]))

    // 过期时间为 4 秒的 cookie1
    let cookie1 = Cookie("1", "1", maxAge: 4, domain: "127.0.0.1", path: "/a/b/")
    let setCookie1 = cookie1.toSetCookieString()
    // 过期时间为 2 秒的 cookie2
    let cookie2 = Cookie("2", "2", maxAge: 2, path: "/a/")
    let setCookie2 = cookie2.toSetCookieString()
    // 服务器发送 Set-Cookie 头，客户端解析并将其存进 CookieJar 中
    server.write(
        "HTTP/1.1 204 ok\r\nSet-Cookie: ${setCookie1}\r\nSet-Cookie: ${setCookie2}\r\nConnection: close\r\n\r\n"
            .toArray())

    let server2 = serverSocket.accept()
    i = server2.read(buf)
    // 接收客户端的带 cookie 的请求
    println(String.fromUtf8(buf[..i]))
    server2.write("HTTP/1.1 204 ok\r\nConnection: close\r\n\r\n".toArray())
    server2.close()
}
```

> **说明**：此示例展示了服务端设置 Cookie 和客户端自动发送 Cookie 的完整流程。第二次请求中，客户端自动附带了之前收到的有效 Cookie。

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
