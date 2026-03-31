# HTTP/2 Server Push

本文档详细介绍 HTTP/2 服务端推送（Server Push）功能。核心 HTTP 服务端用法请参阅 [README.md](./README.md)。

---

## 1. 概述

HTTP/2 Server Push 允许服务端在客户端请求某个资源时，主动推送该资源关联的其他资源（如 CSS、JS、图片等），减少客户端的请求往返，提升页面加载速度。

**前提条件：**
- 必须使用 HTTP/2 协议（需配置 TLS + ALPN `h2`）
- 客户端必须支持 HTTP/2 且未禁用 Server Push

---

## 2. HttpResponsePusher API

**获取推送器：**

```
HttpResponsePusher.getPusher(ctx: HttpContext): ?HttpResponsePusher
```

返回 `Option` 类型，仅在 HTTP/2 连接中可获取到推送器。HTTP/1.x 连接返回 `None`。

**推送方法：**

| 方法 | 签名 | 说明 |
|------|------|------|
| `push` | `push(path: String, method: String, header: HttpHeaders): Unit` | 向客户端推送指定资源 |

**参数说明：**
- `path`：推送资源的路径（如 `"/style.css"`）
- `method`：推送请求的 HTTP 方法（通常为 `"GET"`）
- `header`：推送请求的头部（通常复用原始请求的头部）

---

## 3. 完整示例：服务端推送

以下示例演示访问 `/index.html` 时，服务端主动推送 `/style.css` 和 `/app.js`：

```cangjie
import std.io.*
import std.fs.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}

main() {
    let pem = String.fromUtf8(readToEnd(File("./server.crt", Read)))
    let key = String.fromUtf8(readToEnd(File("./server.key", Read)))
    var tlsConfig = TlsServerConfig(
        X509Certificate.decodeFromPem(pem),
        PrivateKey.decodeFromPem(key)
    )
    tlsConfig.supportedAlpnProtocols = ["h2"]

    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(8443)
        .tlsConfig(tlsConfig)
        .build()

    // 主页面：推送关联资源
    server.distributor.register("/index.html", {
        httpContext =>
        let pusher = HttpResponsePusher.getPusher(httpContext)
        match (pusher) {
            case Some(pusher) =>
                pusher.push("/style.css", "GET", httpContext.request.headers)
                pusher.push("/app.js", "GET", httpContext.request.headers)
            case None => ()
        }
        httpContext.responseBuilder.body("<html><body>Hello HTTP/2!</body></html>")
    })

    // 被推送的资源也需注册 handler
    server.distributor.register("/style.css", {
        httpContext =>
        httpContext.responseBuilder
            .header("Content-Type", "text/css")
            .body("body { font-family: sans-serif; }")
    })
    server.distributor.register("/app.js", {
        httpContext =>
        httpContext.responseBuilder
            .header("Content-Type", "application/javascript")
            .body("console.log('loaded');")
    })

    server.serve()
}
```

---

## 4. 完整示例：服务端 + 客户端

以下示例展示配合 HTTP/2 客户端接收服务端推送的完整场景：

### 4.1 服务端

```cangjie
import std.io.*
import std.fs.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}

main() {
    let certPem = String.fromUtf8(readToEnd(File("/certPath", Read)))
    let keyPem = String.fromUtf8(readToEnd(File("/keyPath", Read)))
    var tlsConfig = TlsServerConfig(
        X509Certificate.decodeFromPem(certPem),
        PrivateKey.decodeFromPem(keyPem)
    )
    tlsConfig.supportedAlpnProtocols = ["h2"]

    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(8443)
        .tlsConfig(tlsConfig)
        .build()

    server
        .distributor
        .register(
            "/index.html",
            {
                httpContext =>
                let pusher = HttpResponsePusher.getPusher(httpContext)
                match (pusher) {
                    case Some(pusher) =>
                        pusher.push("/picture.png", "GET", httpContext.request.headers)
                    case None => ()
                }
                httpContext.responseBuilder.body("index page")
            }
        )

    server.distributor.register("/picture.png", {
        httpContext => httpContext.responseBuilder.body("picture.png")
    })

    server.serve()
}
```

### 4.2 客户端

客户端使用 `ClientBuilder` 并启用 HTTP/2 + Push 接收：

```cangjie
import std.io.*
import std.fs.*
import std.collection.ArrayList
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.net.http.*

main() {
    // TLS 配置，其中 TLS 证书文件用户需自行提供
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("/rootCerPath", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem))
    tlsConfig.alpnProtocolsList = ["h2"]

    let client = ClientBuilder().tlsConfig(tlsConfig).build()

    let response = client.get("https://127.0.0.1:8080/index.html")
    // 接收服务端推送的响应
    let pushResponses: Option<ArrayList<HttpResponse>> = response.getPush()
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

> **注意**：客户端需使用 `["h2"]` ALPN 协议才能接收推送。通过 `response.getPush()` 获取服务端推送的响应列表。

---

## 5. 注意事项

- Server Push 仅适用于 HTTP/2 协议，HTTP/1.x 下 `getPusher()` 返回 `None`
- 推送的资源路径必须在服务端注册对应的 Handler，否则客户端会收到错误
- 推送在 `handler` 执行期间发起，推送请求的头部通常复用原始请求头
- 部分客户端或浏览器可能拒绝推送（如已有缓存），此时推送会被忽略
- Server Push 需要 TLS 配置，详见 [HTTPS.md](./HTTPS.md)
