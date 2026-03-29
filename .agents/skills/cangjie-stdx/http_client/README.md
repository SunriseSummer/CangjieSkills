# 仓颉语言 HTTP/HTTPS 客户端编程（stdx.net.http）

## 1. 概述

- 依赖 `stdx.net.http`，关于扩展标准库 `stdx` 的配置用法，请参阅 `cangjie-stdx` Skill
- 支持 HTTP/1.0、1.1、2.0（RFC 9110/9112/9113/9218/7541）
- 核心模式：`ClientBuilder` 构建 → `Client` 发送请求 → 读取响应 → `close()` 释放
- HTTPS 需配置 `TlsClientConfig` 并传入 `ClientBuilder.tlsConfig()`，详见下方第 9 节

---

## 2. 快速入门

```cangjie
package test_proj
import stdx.net.http.*
import std.io.StringReader

main() {
    // 1. 构建 Client
    let client = ClientBuilder().build()

    // 2. 发送 GET 请求（示例使用本地地址，实际替换为目标服务）
    // let resp = client.get("http://example.com/hello")

    // 3. 读取响应体
    // let body = StringReader(resp.body).readToEnd()
    // println("Status: ${resp.status}")
    // println("Body: ${body}")

    // 4. 关闭客户端，释放所有连接
    println("Client created and closed successfully")
    client.close()
}
```

---

## 3. ClientBuilder 配置

### 3.1 完整配置接口

| 方法 | 签名 | 说明 |
|------|------|------|
| `build` | `build(): Client` | 构建 Client 实例 |
| `tlsConfig` | `tlsConfig(TlsClientConfig): ClientBuilder` | TLS 配置（启用 HTTPS，详见第 9 节） |
| `httpProxy` | `httpProxy(String): ClientBuilder` | HTTP 代理（格式：`"http://host:port"`） |
| `httpsProxy` | `httpsProxy(String): ClientBuilder` | HTTPS 代理 |
| `noProxy` | `noProxy(): ClientBuilder` | 不使用代理（忽略环境变量） |
| `cookieJar` | `cookieJar(?CookieJar): ClientBuilder` | Cookie 管理器（默认启用） |
| `autoRedirect` | `autoRedirect(Bool): ClientBuilder` | 自动跟随重定向（默认 true，304 不重定向） |
| `readTimeout` | `readTimeout(Duration): ClientBuilder` | 读超时（默认 15 秒） |
| `writeTimeout` | `writeTimeout(Duration): ClientBuilder` | 写超时（默认 15 秒） |
| `poolSize` | `poolSize(Int64): ClientBuilder` | HTTP/1.1 连接池大小（同一 host:port 最大连接数，默认 10） |
| `logger` | `logger(Logger): ClientBuilder` | 自定义日志（需线程安全） |
| `connector` | `connector((SocketAddress) -> StreamingSocket): ClientBuilder` | 自定义 TCP 连接函数 |

**HTTP/2 专用配置：**

| 方法 | 说明 |
|------|------|
| `enablePush(Bool)` | 是否接收服务端推送（默认 true） |
| `headerTableSize(UInt32)` | Hpack 动态表初始值（默认 4096） |
| `maxConcurrentStreams(UInt32)` | 最大并发流数 |
| `initialWindowSize(UInt32)` | 初始流控窗口大小（默认 65535） |
| `maxFrameSize(UInt32)` | 最大帧大小（默认 16384） |
| `maxHeaderListSize(UInt32)` | 最大头部列表大小 |

### 3.2 配置示例

```cangjie
package test_proj
import stdx.net.http.*
import std.time.*

main() {
    let client = ClientBuilder()
        .readTimeout(Duration.second * 30)
        .writeTimeout(Duration.second * 10)
        .poolSize(20)
        .autoRedirect(true)
        .build()

    println("Client configured successfully")
    client.close()
}
```

---

## 4. Client 常用方法

### 4.1 快捷请求方法

| 方法 | 签名 | 说明 |
|------|------|------|
| `get` | `get(url: String): HttpResponse` | GET 请求 |
| `post` | `post(url: String, body: String): HttpResponse` | POST 请求（字符串体） |
| `post` | `post(url: String, body: Array<UInt8>): HttpResponse` | POST 请求（字节体） |
| `post` | `post(url: String, body: InputStream): HttpResponse` | POST 请求（流式体） |
| `put` | `put(url: String, body: String): HttpResponse` | PUT 请求（字符串体） |
| `put` | `put(url: String, body: Array<UInt8>): HttpResponse` | PUT 请求（字节体） |
| `put` | `put(url: String, body: InputStream): HttpResponse` | PUT 请求（流式体） |
| `delete` | `delete(url: String): HttpResponse` | DELETE 请求 |
| `head` | `head(url: String): HttpResponse` | HEAD 请求 |
| `options` | `options(url: String): HttpResponse` | OPTIONS 请求 |
| `send` | `send(req: HttpRequest): HttpResponse` | 发送自定义请求 |
| `close` | `close(): Unit` | 关闭客户端，释放所有连接 |

---

## 5. HttpRequestBuilder 自定义请求

### 5.1 完整接口

| 方法 | 签名 | 说明 |
|------|------|------|
| `url` | `url(String): HttpRequestBuilder` | 设置请求 URL |
| `url` | `url(URL): HttpRequestBuilder` | 设置请求 URL（URL 对象） |
| `method` | `method(String): HttpRequestBuilder` | 设置 HTTP 方法 |
| `get`/`post`/`put`/`delete`... | `get(): HttpRequestBuilder` 等 | 便捷方法设置 HTTP 方法 |
| `header` | `header(String, String): HttpRequestBuilder` | 添加请求头 |
| `addHeaders` | `addHeaders(HttpHeaders): HttpRequestBuilder` | 批量添加请求头 |
| `setHeaders` | `setHeaders(HttpHeaders): HttpRequestBuilder` | 替换全部请求头 |
| `body` | `body(String): HttpRequestBuilder` | 设置字符串请求体 |
| `body` | `body(Array<UInt8>): HttpRequestBuilder` | 设置字节数组请求体 |
| `body` | `body(InputStream): HttpRequestBuilder` | 设置流式请求体 |
| `trailer` | `trailer(String, String): HttpRequestBuilder` | 添加 Trailer |
| `version` | `version(Protocol): HttpRequestBuilder` | 指定协议版本 |
| `readTimeout` | `readTimeout(Duration): HttpRequestBuilder` | 请求级读超时（覆盖 Client 级别） |
| `writeTimeout` | `writeTimeout(Duration): HttpRequestBuilder` | 请求级写超时（覆盖 Client 级别） |
| `priority` | `priority(Int64, Bool): HttpRequestBuilder` | HTTP/2 优先级（urgency 0-7, incremental） |
| `build` | `build(): HttpRequest` | 构建 HttpRequest 实例 |

### 5.2 自定义请求示例

```cangjie
package test_proj
import stdx.net.http.*

main() {
    let client = ClientBuilder().build()

    // 构建自定义 POST 请求
    let req = HttpRequestBuilder()
        .post()
        .url("http://127.0.0.1:8080/api/data")
        .header("Content-Type", "application/json")
        .header("Authorization", "******")
        .body("{\"key\": \"value\", \"count\": 42}")
        .build()

    println("Request built: ${req.method} ${req.url}")
    client.close()
}
```

---

## 6. 响应（HttpResponse）处理

### 6.1 HttpResponse 属性

| 属性/方法 | 类型 | 说明 |
|-----------|------|------|
| `status` | `UInt16` | 状态码（200、404 等） |
| `headers` | `HttpHeaders` | 响应头 |
| `body` | `InputStream` | 响应体（流式读取） |
| `bodySize` | `Option<Int64>` | 响应体大小（未知时为 None） |
| `trailers` | `HttpHeaders` | Trailer 头 |
| `version` | `Protocol` | 协议版本 |
| `close()` | `Unit` | 关闭未读完的 body 释放资源 |

### 6.2 读取响应体

使用 `StringReader` 一次性读取全部字符串：

```cangjie
// let body = StringReader(resp.body).readToEnd()
```

逐块读取大文件：

```cangjie
// let buf = Array<UInt8>(4096, repeat: 0)
// var len = resp.body.read(buf)
// while (len > 0) {
//     println("Read ${len} bytes")
//     len = resp.body.read(buf)
// }
```

> **重要**：HTTP/1.1 的 `body` 必须完全读取后连接才能被复用。如不需要 body，调用 `resp.close()` 释放资源。

---

## 7. Cookie 管理

### 7.1 自动 Cookie 管理

`ClientBuilder` 默认启用 `CookieJar`，自动处理 `Set-Cookie` 和 `Cookie` 头。

### 7.2 禁用 Cookie

```cangjie
package test_proj
import stdx.net.http.*

main() {
    // 传 None 禁用 Cookie 管理
    let client = ClientBuilder().cookieJar(None).build()
    println("Client without cookies created")
    client.close()
}
```

### 7.3 Cookie 类构造

```
Cookie(name: String, value: String,
    maxAge: Int64,          // 过期秒数
    domain: String,         // 域名
    path: String)           // 路径
```

- `toSetCookieString()` — 生成 `Set-Cookie` 头值（服务端用）
- `CookieJar.toCookieString(cookies)` — 生成 `Cookie` 头值
- `CookieJar.parseSetCookieHeader(resp)` — 解析响应中的 `Set-Cookie` 头

---

## 8. 代理配置

```cangjie
package test_proj
import stdx.net.http.*

main() {
    // HTTP 代理
    let client = ClientBuilder()
        .httpProxy("http://proxy.example.com:8080")
        .build()

    println("Proxy client created")
    client.close()
}
```

> **说明**：默认使用系统环境变量 `http_proxy` / `https_proxy` 的值。使用 `noProxy()` 忽略环境变量代理设置。

---

## 9. HTTPS 配置（TLS 加密）

HTTPS = HTTP + TLS，在 HTTP 客户端基础上通过 `ClientBuilder.tlsConfig()` 添加 TLS 加密层。

### 9.1 TlsClientConfig 配置

| 属性 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `verifyMode` | `CertificateVerifyMode` | `Default` | 证书验证模式 |
| `domain` | `?String` | `None` | 服务端主机名（SNI），通常自动从 URL 获取 |
| `alpnProtocolsList` | `Array<String>` | `[]` | ALPN 协议列表（设置 `["h2"]` 启用 HTTP/2） |
| `clientCertificate` | `?(Array<X509Certificate>, PrivateKey)` | `None` | 客户端证书链和私钥的可选元组（双向认证时使用） |
| `cipherSuitesV1_2` | `?Array<String>` | `None` | TLS 1.2 密码套件名称列表 |
| `cipherSuitesV1_3` | `?Array<String>` | `None` | TLS 1.3 密码套件名称列表 |
| `minVersion` | `TlsVersion` | `V1_2` | 最低 TLS 版本 |
| `maxVersion` | `TlsVersion` | `V1_3` | 最高 TLS 版本 |
| `securityLevel` | `Int32` | `2` | 安全级别（0-5） |
| `signatureAlgorithms` | `?Array<SignatureAlgorithm>` | `None` | 签名算法偏好 |
| `keylogCallback` | `?(TlsSocket, String) -> Unit` | `None` | TLS 密钥日志回调（调试用） |

### 9.2 证书验证模式（CertificateVerifyMode）

| 模式 | 说明 | 适用场景 |
|------|------|----------|
| `Default` | 使用系统 CA 验证服务端证书 | **生产环境**（默认） |
| `CustomCA(certs)` | 使用自定义 CA 列表验证 | 自签名证书或私有 CA |
| `TrustAll` | 信任所有证书，不验证 | **仅限开发测试** |

### 9.3 快速入门（TrustAll 模式，仅测试用）

> **⚠️ 警告**：`TrustAll` 模式跳过证书验证，**仅限开发测试环境使用**，生产环境请使用 `Default` 或 `CustomCA` 模式。

```cangjie
package test_proj
import stdx.net.http.*
import stdx.net.tls.*

main() {
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = TrustAll

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    // let resp = client.get("https://127.0.0.1:8443/api")
    // println("Status: ${resp.status}")

    println("HTTPS client created successfully")
    client.close()
}
```

### 9.4 使用自定义 CA 证书（CustomCA 模式）

适用于自签名证书或内部私有 CA 的场景：

```cangjie
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.*
import std.fs.*

main() {
    // 加载自定义 CA 证书
    let caPem = String.fromUtf8(readToEnd(File("./ca.crt", Read)))
    let caCerts = X509Certificate.decodeFromPem(caPem)

    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = CustomCA(caCerts)

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    let resp = client.get("https://myserver.example.com/api")
    println(StringReader(resp.body).readToEnd())

    client.close()
}
```

### 9.5 启用 HTTP/2

HTTP/2 需要 TLS + ALPN `h2` 配置。如果握手失败，自动回退 HTTP/1.1。

```cangjie
package test_proj
import stdx.net.http.*
import stdx.net.tls.*

main() {
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = TrustAll
    tlsConfig.alpnProtocolsList = ["h2"]

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    println("HTTP/2 client created successfully")
    client.close()
}
```

> **说明**：不支持通过 `Upgrade: h2c` 从 HTTP/1.1 升级到 HTTP/2。

### 9.6 双向 TLS 认证（客户端证书）

当服务端要求客户端提供证书时，需配置客户端证书链和私钥：

```cangjie
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import std.io.*
import std.fs.*

main() {
    // 加载 CA 证书（用于验证服务端）
    let caPem = String.fromUtf8(readToEnd(File("./ca.crt", Read)))
    let caCerts = X509Certificate.decodeFromPem(caPem)

    // 加载客户端证书链和私钥
    let clientPem = String.fromUtf8(readToEnd(File("./client.crt", Read)))
    let clientKey = String.fromUtf8(readToEnd(File("./client.key", Read)))
    let clientCerts = X509Certificate.decodeFromPem(clientPem)
    let clientPrivateKey = PrivateKey.decodeFromPem(clientKey)

    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = CustomCA(caCerts)
    // 设置客户端证书（双向认证），注意是证书链数组
    tlsConfig.clientCertificate = (clientCerts, clientPrivateKey)

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    let resp = client.get("https://secure.example.com/api")
    println(StringReader(resp.body).readToEnd())

    client.close()
}
```

### 9.7 HTTP/2 Server Push 接收

当服务端使用 HTTP/2 Server Push 主动推送资源时，客户端可通过 `resp.getPush()` 获取推送的响应：

```cangjie
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.*
import std.fs.*

main() {
    let caPem = String.fromUtf8(readToEnd(File("./ca.crt", Read)))
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(caPem))
    tlsConfig.alpnProtocolsList = ["h2"]

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .enablePush(true)
        .build()

    let resp = client.get("https://127.0.0.1:8443/index.html")
    println("Main response status: ${resp.status}")
    println("Main body: ${StringReader(resp.body).readToEnd()}")

    // 获取服务端推送的响应
    let pushResponses = resp.getPush()
    match (pushResponses) {
        case Some(pushList) =>
            for (pushResp in pushList) {
                println("Pushed: ${pushResp.status}")
            }
        case None =>
            println("No server push")
    }

    client.close()
}
```

### 9.8 高级 TLS 配置

```cangjie
package test_proj
import stdx.net.http.*
import stdx.net.tls.*

main() {
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = TrustAll
    // 仅允许 TLS 1.3
    tlsConfig.minVersion = V1_3
    tlsConfig.maxVersion = V1_3
    tlsConfig.alpnProtocolsList = ["h2"]

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    println("TLS 1.3 only client created")
    client.close()
}
```

---

## 10. 异常类型

| 异常 | 说明 |
|------|------|
| `HttpException` | HTTP 通用异常（连接池满、协议错误等） |
| `HttpTimeoutException` | 请求超时或读响应体超时 |
| `HttpStatusException` | 响应状态异常 |
| `ConnectionException` | TCP 连接异常（读数据时对端已关闭） |
| `TlsException` | TLS 握手或通信异常（证书无效、OpenSSL 未安装等） |

> **注意**：HTTPS 场景如果未安装 OpenSSL 3 或安装了低版本，运行时会抛出 `TlsException: Can not load openssl library or function xxx`。

---

## 11. 关键规则速查

| 规则 | 说明 |
|------|------|
| 读取响应体 | 使用 `StringReader(resp.body).readToEnd()` 读取字符串，或逐块 `resp.body.read(buf)` |
| 释放连接 | body 读完后连接自动归还连接池；不需要 body 时调用 `resp.close()` |
| 关闭客户端 | 使用完毕后调用 `client.close()` 释放所有连接 |
| 连接池限制 | HTTP/1.1 默认同一 host 最多 10 个连接，超出抛 `HttpException` |
| Content-Length | 使用 `String` / `Array<UInt8>` 设置 body 时自动补充；使用自定义 `InputStream` 时需手动设置 |
| 自动重定向 | 默认启用，304 状态码不重定向 |
| Cookie 管理 | 默认启用 `CookieJar`，自动处理 `Set-Cookie` / `Cookie` 头 |
| 代理 | 默认使用环境变量 `http_proxy` / `https_proxy`；`noProxy()` 禁用 |
| TRACE 请求 | 协议规定 TRACE 请求不能携带 body |
| 请求级超时 | `HttpRequestBuilder.readTimeout()` / `writeTimeout()` 覆盖 Client 级别设置 |
| 启用 HTTPS | `ClientBuilder().tlsConfig(tlsConfig)` |
| 系统 CA 验证 | `tlsConfig.verifyMode = Default`（默认值） |
| 自定义 CA | `tlsConfig.verifyMode = CustomCA(certs)` |
| 跳过验证（测试） | `tlsConfig.verifyMode = TrustAll`（**仅测试用**） |
| 启用 HTTP/2 | `tlsConfig.alpnProtocolsList = ["h2"]`；握手失败自动回退 HTTP/1.1 |
| 双向认证 | `tlsConfig.clientCertificate = (certChain, privateKey)` |
| Server Push | `resp.getPush()` 获取推送响应；`enablePush(false)` 禁用 |
| OpenSSL 依赖 | HTTPS 需安装 OpenSSL 3，详见 `cangjie-stdx` Skill 下的 tls 文档 |
