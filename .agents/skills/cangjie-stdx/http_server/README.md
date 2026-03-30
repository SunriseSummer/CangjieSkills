# 仓颉语言 HTTP/HTTPS 服务端编程（stdx.net.http）

## 1. 概述

- 依赖 `stdx.net.http`，关于扩展标准库 `stdx` 的配置用法，请参阅 `cangjie-stdx` Skill
- 支持 HTTP/1.0、1.1、2.0（RFC 9110/9112/9113/9218/7541）
- 核心模式：`ServerBuilder` 构建 → `Server` 注册路由 → `serve()` 阻塞运行
- HTTPS 需配置 `TlsServerConfig` 并传入 `ServerBuilder.tlsConfig()`，详见 [HTTPS.md](./HTTPS.md)

---

## 2. 快速入门

```cangjie
package test_proj
import stdx.net.http.*
import std.sync.SyncCounter

main() {
    // 1. 构建 Server
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .build()

    // 2. 注册路由处理器
    server.distributor.register("/hello", {
        httpContext =>
        httpContext.responseBuilder.body("Hello 仓颉!")
    })

    let ready = SyncCounter(1)
    server.afterBind({ => ready.dec() })

    // 3. 后台启动服务
    spawn { server.serve() }
    ready.waitUntilZero()
    println("Server listening on port ${server.port}")
    server.close()
}
```

---

## 3. ServerBuilder 配置

### 3.1 完整配置接口

| 方法 | 签名 | 说明 |
|------|------|------|
| `addr` | `addr(String): ServerBuilder` | 监听地址（如 `"0.0.0.0"`） |
| `port` | `port(UInt16): ServerBuilder` | 监听端口（0 表示随机端口） |
| `tlsConfig` | `tlsConfig(TlsServerConfig): ServerBuilder` | TLS 配置（启用 HTTPS，详见 [HTTPS.md](./HTTPS.md)） |
| `distributor` | `distributor(HttpRequestDistributor): ServerBuilder` | 自定义请求分发器 |
| `readTimeout` | `readTimeout(Duration): ServerBuilder` | 读取整个请求超时 |
| `writeTimeout` | `writeTimeout(Duration): ServerBuilder` | 写响应超时 |
| `readHeaderTimeout` | `readHeaderTimeout(Duration): ServerBuilder` | 读取请求头超时 |
| `httpKeepAliveTimeout` | `httpKeepAliveTimeout(Duration): ServerBuilder` | HTTP/1.1 Keep-Alive 超时 |
| `maxRequestBodySize` | `maxRequestBodySize(Int64): ServerBuilder` | 请求体最大大小（默认 2MB，-1 不限制） |
| `maxRequestHeaderSize` | `maxRequestHeaderSize(Int64): ServerBuilder` | 请求头最大大小（默认 1MB，-1 不限制） |
| `transportConfig` | `transportConfig(TransportConfig): ServerBuilder` | 传输层配置 |
| `logger` | `logger(Logger): ServerBuilder` | 自定义日志（需线程安全） |
| `listener` | `listener(ServerSocket): ServerBuilder` | 自定义监听 Socket（设置后忽略 addr/port） |
| `servicePoolConfig` | `servicePoolConfig(ServicePoolConfig): ServerBuilder` | 协程池配置 |
| `afterBind` | `afterBind(() -> Unit): ServerBuilder` | 绑定端口后回调 |
| `onShutdown` | `onShutdown(() -> Unit): ServerBuilder` | 关闭时回调 |
| `build` | `build(): Server` | 构建 Server 实例（此时校验参数合法性） |

**HTTP/2 专用配置：**

| 方法 | 说明 |
|------|------|
| `headerTableSize(UInt32)` | Hpack 动态表初始值（默认 4096） |
| `maxConcurrentStreams(UInt32)` | 最大并发流数 |
| `initialWindowSize(UInt32)` | 初始流控窗口大小（默认 65535） |
| `maxFrameSize(UInt32)` | 最大帧大小（默认 16384） |
| `maxHeaderListSize(UInt32)` | 最大头部列表大小 |
| `enableConnectProtocol(Bool)` | 是否接受 CONNECT 请求（默认 false） |

**TransportConfig 属性：**

| 属性 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `readTimeout` | `Duration` | `Duration.Max` | 传输层读超时 |
| `writeTimeout` | `Duration` | `Duration.Max` | 传输层写超时 |
| `readBufferSize` | `?Int64` | `None` | 读缓冲区大小 |
| `writeBufferSize` | `?Int64` | `None` | 写缓冲区大小 |
| `keepAliveConfig` | `SocketKeepAliveConfig` | idle 45s, probe 5s, max 5 | TCP Keep-Alive 配置 |

**ServicePoolConfig 属性：**

| 属性 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `capacity` | `Int64` | `10000` | 协程池容量 |
| `queueCapacity` | `Int64` | `10000` | 队列容量 |
| `preheat` | `Int64` | `0` | 预初始化协程数 |

---

## 4. Server 接口

| 方法 | 签名 | 说明 |
|------|------|------|
| `serve` | `serve(): Unit` | 阻塞运行服务 |
| `close` | `close(): Unit` | 立即关闭所有连接 |
| `closeGracefully` | `closeGracefully(): Unit` | 优雅关闭（等待进行中请求完成） |
| `distributor` | `distributor: HttpRequestDistributor` | 获取分发器，用于注册路由 |
| `port` | `port: UInt16` | 获取实际监听端口 |
| `addr` | `addr: String` | 获取监听地址 |
| `logger` | `logger: Logger` | 获取日志记录器 |
| `afterBind` | `afterBind(() -> Unit): Unit` | 绑定端口后的回调 |
| `onShutdown` | `onShutdown(() -> Unit): Unit` | 关闭时回调 |

---

## 5. 路由注册与请求处理

### 5.1 基本路由注册

```cangjie
package test_proj
import stdx.net.http.*
import std.sync.SyncCounter

main() {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    // Lambda 形式注册
    server.distributor.register("/hello", {
        ctx => ctx.responseBuilder.body("Hello!")
    })

    // 多路径注册
    server.distributor.register("/json", {
        ctx =>
        ctx.responseBuilder
            .header("Content-Type", "application/json")
            .body("{\"status\": \"ok\"}")
    })

    let ready = SyncCounter(1)
    server.afterBind({ => ready.dec() })
    spawn { server.serve() }
    ready.waitUntilZero()
    println("Server started on port ${server.port}")
    server.close()
}
```

### 5.2 HttpContext 详解

`HttpContext` 是 handler 中的请求上下文，提供对请求和响应的完整访问：

| 属性/方法 | 类型 | 说明 |
|-----------|------|------|
| `request` | `HttpRequest` | 客户端发来的请求 |
| `responseBuilder` | `HttpResponseBuilder` | 响应构建器 |
| `clientCertificate` | `?Array<X509Certificate>` | 客户端证书（双向认证时可用） |
| `isClosed()` | `Bool` | 连接/流是否已关闭 |

**通过 request 获取请求信息：**

| 属性 | 类型 | 说明 |
|------|------|------|
| `request.method` | `String` | 请求方法（GET/POST/...） |
| `request.url` | `URL` | 请求 URL |
| `request.headers` | `HttpHeaders` | 请求头 |
| `request.body` | `InputStream` | 请求体（流式读取） |
| `request.form` | `Form` | 表单数据（自动解析 URL 编码的表单或 query 参数） |
| `request.remoteAddr` | `String` | 客户端地址（格式 `ip:port`） |
| `request.version` | `Protocol` | 协议版本 |

---

## 6. HttpResponseBuilder 接口

| 方法 | 签名 | 说明 |
|------|------|------|
| `status` | `status(UInt16): HttpResponseBuilder` | 设置状态码（默认 200） |
| `header` | `header(String, String): HttpResponseBuilder` | 添加响应头 |
| `body` | `body(String): HttpResponseBuilder` | 设置字符串响应体 |
| `body` | `body(Array<UInt8>): HttpResponseBuilder` | 设置字节数组响应体 |
| `body` | `body(InputStream): HttpResponseBuilder` | 设置流式响应体 |
| `trailer` | `trailer(String, String): HttpResponseBuilder` | 设置 Trailer |
| `addHeaders` | `addHeaders(HttpHeaders): HttpResponseBuilder` | 批量添加响应头 |
| `setHeaders` | `setHeaders(HttpHeaders): HttpResponseBuilder` | 替换全部响应头 |
| `addTrailers` | `addTrailers(HttpHeaders): HttpResponseBuilder` | 批量添加 Trailer |
| `setTrailers` | `setTrailers(HttpHeaders): HttpResponseBuilder` | 替换全部 Trailer |
| `build` | `build(): HttpResponse` | 构建 HttpResponse |

---

## 7. 内置 Handler

| Handler | 说明 |
|---------|------|
| `NotFoundHandler()` | 返回 404 Not Found |
| `RedirectHandler(url, statusCode)` | 重定向（如 301/302/308） |
| `FileHandler(path, handlerType!, bufferSize!)` | 静态文件服务（上传/下载） |
| `OptionsHandler()` | 处理 OPTIONS 请求，返回 Allow 头 |
| `FuncHandler(lambda)` | 将 Lambda 包装为 HttpRequestHandler |

---

## 8. 自定义分发器

实现 `HttpRequestDistributor` 接口可自定义路由逻辑：

```cangjie
package test_proj
import stdx.net.http.*
import std.collection.HashMap
import std.sync.SyncCounter

class PrefixDistributor <: HttpRequestDistributor {
    let map = HashMap<String, HttpRequestHandler>()

    public func register(path: String, handler: HttpRequestHandler): Unit {
        map.add(path, handler)
    }

    public func register(path: String, handler: (HttpContext) -> Unit): Unit {
        map.add(path, FuncHandler(handler))
    }

    public func distribute(path: String): HttpRequestHandler {
        if (map.contains(path)) {
            return map.get(path) ?? NotFoundHandler()
        }
        for ((prefix, handler) in map) {
            if (path.startsWith(prefix)) {
                return handler
            }
        }
        return NotFoundHandler()
    }
}

main() {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .distributor(PrefixDistributor())
        .build()

    server.distributor.register("/api/", {
        ctx => ctx.responseBuilder.body("API endpoint")
    })

    let ready = SyncCounter(1)
    server.afterBind({ => ready.dec() })
    spawn { server.serve() }
    ready.waitUntilZero()
    println("Server with custom distributor on port ${server.port}")
    server.close()
}
```

> **注意**：默认分发器非线程安全，只能在 `serve()` 之前注册路由。如需运行时动态注册，请实现线程安全的自定义分发器。

---

## 9. 后台启动与优雅关闭

`serve()` 是阻塞调用，可在新线程中启动：

```cangjie
package test_proj
import stdx.net.http.*
import std.sync.SyncCounter

main() {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    server.distributor.register("/health", {
        ctx => ctx.responseBuilder.body("ok")
    })

    // 使用 SyncCounter 等待服务器绑定完成
    let ready = SyncCounter(1)
    server.afterBind({ => ready.dec() })

    // 注册关闭回调
    server.onShutdown({ => println("Server stopped") })

    // 后台启动
    spawn { server.serve() }
    ready.waitUntilZero()

    println("Server listening on port ${server.port}")

    // 优雅关闭
    server.closeGracefully()
}
```

---

## 10. HTTPS 配置（TLS 加密）

HTTPS = HTTP + TLS，在 HTTP 服务端基础上通过 `ServerBuilder.tlsConfig()` 添加 TLS 加密层。包括 TLS 配置、证书热更新、双向认证（mTLS）等内容。

👉 详见 [HTTPS.md](./HTTPS.md)

---

## 11. 分块响应与 Trailer

服务端可通过 `HttpResponseWriter` 实现分块传输（Chunked Transfer-Encoding），逐块写入响应数据，并在结束后附加 Trailer 头。

👉 详见 [CHUNKED.md](./CHUNKED.md)

---

## 12. HTTP/2 Server Push

仅用于 HTTP/2 协议（需 TLS + ALPN `h2`），允许服务端主动推送关联资源给客户端，减少客户端请求往返。

👉 详见 [PUSH.md](./PUSH.md)

---

## 13. 异常类型

| 异常 | 说明 |
|------|------|
| `HttpException` | HTTP 通用异常（路由重复注册、协议错误等） |
| `HttpTimeoutException` | 超时异常 |
| `ConnectionException` | TCP 连接异常（对端关闭等） |
| `CoroutinePoolRejectException` | 协程池拒绝处理请求 |
| `TlsException` | TLS 握手或通信异常（HTTPS 场景） |

> **注意**：HTTPS 场景如果未安装 OpenSSL 3 或安装了低版本，运行时会抛出 `TlsException: Can not load openssl library or function xxx`。

---

## 14. 关键规则速查

| 规则 | 说明 |
|------|------|
| 设置响应体 | 通过 `httpContext.responseBuilder.body(...)` 设置 |
| 设置状态码 | 通过 `httpContext.responseBuilder.status(code)` 设置，默认 200 |
| 阻塞调用 | `server.serve()` 阻塞当前线程；需后台运行时用 `spawn { server.serve() }` |
| 获取实际端口 | 端口设为 0 时，`server.port` 获取系统分配的实际端口 |
| 路由注册时机 | 默认分发器非线程安全，只能在 `serve()` 之前注册 |
| 日志 | `server.logger.level = LogLevel.DEBUG` 开启调试日志 |
| 优雅关闭 | `closeGracefully()` 等待进行中请求完成；`close()` 立即关闭 |
| Handler 安全 | Handler 中应对 Host 请求头进行合法性校验，防止 DNS 重绑定攻击 |
| 启用 HTTPS | `ServerBuilder().tlsConfig(tlsConfig)`，详见 [HTTPS.md](./HTTPS.md) |
| 启用 HTTP/2 | `tlsConfig.supportedAlpnProtocols = ["h2"]`；握手失败自动回退 HTTP/1.1 |
| 证书热更新 | `server.updateCert(certPath, keyPath)` / `server.updateCA(caPath)`，详见 [HTTPS.md](./HTTPS.md) |
| 双向认证 | `tlsConfig.clientIdentityRequired = Required` + `tlsConfig.verifyMode = CustomCA(caCerts)`，详见 [HTTPS.md](./HTTPS.md) |
| 获取客户端证书 | Handler 中通过 `ctx.clientCertificate` 获取 |
| 分块响应 | 使用 `HttpResponseWriter` 逐块写入，详见 [CHUNKED.md](./CHUNKED.md) |
| Server Push | `HttpResponsePusher.getPusher(ctx)` 获取推送器，仅 HTTP/2 可用，详见 [PUSH.md](./PUSH.md) |
| OpenSSL 依赖 | HTTPS 需安装 OpenSSL 3，详见 `cangjie-stdx` Skill 下的 tls 文档 |
