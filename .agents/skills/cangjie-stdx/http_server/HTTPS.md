# HTTPS/TLS 服务端配置（stdx.net.http + stdx.net.tls）

本文档详细介绍 HTTP 服务端的 HTTPS/TLS 配置。核心 HTTP 服务端用法请参阅 [README.md](./README.md)。

---

## 1. TlsServerConfig 配置

**构造函数：**

```
TlsServerConfig(certChain: Array<X509Certificate>, certKey: PrivateKey)
```

必须提供服务端证书链（`Array<X509Certificate>`）和对应私钥。注意 `X509Certificate.decodeFromPem()` 返回的就是 `Array<X509Certificate>`。

| 属性 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `supportedAlpnProtocols` | `Array<String>` | `[]` | 支持的 ALPN 协议（设置 `["h2"]` 启用 HTTP/2） |
| `clientIdentityRequired` | `TlsClientIdentificationMode` | `Disabled` | 客户端证书认证模式 |
| `verifyMode` | `CertificateVerifyMode` | `Default` | 证书验证模式（双向认证时验证客户端证书） |
| `cipherSuitesV1_2` | `Array<String>` | `[]` | TLS 1.2 密码套件名称列表 |
| `cipherSuitesV1_3` | `Array<String>` | `[]` | TLS 1.3 密码套件名称列表 |
| `minVersion` | `TlsVersion` | `V1_2` | 最低 TLS 版本 |
| `maxVersion` | `TlsVersion` | `V1_3` | 最高 TLS 版本 |
| `securityLevel` | `Int32` | `2` | 安全级别（0-5） |
| `dhParameters` | `?DHParameters` | `None` | DH 密钥交换参数 |

---

## 2. 客户端认证模式（TlsClientIdentificationMode）

| 模式 | 说明 | 适用场景 |
|------|------|----------|
| `Disabled` | 不要求客户端证书（单向认证，默认） | 普通 HTTPS 网站 |
| `Optional` | 客户端可选提供证书 | 可选增强认证 |
| `Required` | 客户端必须提供证书（双向认证/mTLS） | 微服务间通信、高安全场景 |

---

## 3. HTTPS 快速入门

最简 HTTPS 服务端只需提供证书和私钥：

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

    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(8443)
        .tlsConfig(tlsConfig)
        .build()

    server.distributor.register("/", {
        ctx => ctx.responseBuilder.body("Hello HTTPS!")
    })
    server.serve()
}
```

---

## 4. 自定义网络配置（TransportConfig + TLS）

可同时配置传输层参数和 TLS，适用于需要精细调控的生产环境：

```cangjie
import std.io.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import stdx.net.http.*

main() {
    var transportCfg = TransportConfig()
    transportCfg.readBufferSize = 8192

    let pem0 = String.fromUtf8(readToEnd(File("/certPath", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("/keyPath", Read)))
    var tlsConfig = TlsServerConfig(
        X509Certificate.decodeFromPem(pem0),
        PrivateKey.decodeFromPem(pem02)
    )
    tlsConfig.supportedAlpnProtocols = ["h2"]

    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(8080)
        .transportConfig(transportCfg)
        .tlsConfig(tlsConfig)
        .headerTableSize(10 * 1024)
        .maxRequestHeaderSize(1024 * 1024)
        .build()

    server.distributor.register("/index", {
        httpContext => httpContext.responseBuilder.body("Hello 仓颉!")
    })
    server.serve()
}
```

---

## 5. 证书热更新

运行时无需重启服务即可更新 TLS 证书，更新后新建连接将使用新证书：

| 方法 | 签名 | 说明 |
|------|------|------|
| `updateCert` | `updateCert(String, String): Unit` | 通过文件路径更新证书和私钥 |
| `updateCert` | `updateCert(Array<X509Certificate>, PrivateKey): Unit` | 通过对象更新证书和私钥 |
| `updateCA` | `updateCA(String): Unit` | 通过文件路径更新 CA 证书 |
| `updateCA` | `updateCA(Array<X509Certificate>): Unit` | 通过对象更新 CA 证书 |

### 完整示例

```cangjie
import std.io.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import stdx.net.http.*

main() {
    let pem0 = String.fromUtf8(readToEnd(File("/certPath", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("/keyPath", Read)))
    var tlsConfig = TlsServerConfig(
        X509Certificate.decodeFromPem(pem0),
        PrivateKey.decodeFromPem(pem02)
    )
    tlsConfig.supportedAlpnProtocols = ["http/1.1"]

    let pem = String.fromUtf8(readToEnd(File("/rootCerPath", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem))

    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(8080)
        .tlsConfig(tlsConfig)
        .build()

    spawn {
        server.serve()
    }

    // 运行时热更新证书和私钥
    server.updateCert("/newCerPath", "/newKeyPath")
    // 运行时热更新 CA 证书
    server.updateCA("/newRootCerPath")
}
```

---

## 6. 双向 TLS 认证（mTLS）

双向认证要求客户端也提供证书，服务端验证客户端身份。需设置：
- `clientIdentityRequired = Required`：要求客户端必须提供证书
- `verifyMode = CustomCA(...)`：指定用于验证客户端证书的 CA

### 完整示例

```cangjie
import std.io.*
import std.fs.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}

main() {
    let pem = String.fromUtf8(readToEnd(File("./server.crt", Read)))
    let key = String.fromUtf8(readToEnd(File("./server.key", Read)))
    let caPem = String.fromUtf8(readToEnd(File("./ca.crt", Read)))

    var tlsConfig = TlsServerConfig(
        X509Certificate.decodeFromPem(pem),
        PrivateKey.decodeFromPem(key)
    )
    // 要求客户端提供证书
    tlsConfig.clientIdentityRequired = Required
    // 使用自定义 CA 验证客户端证书
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(caPem))

    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(8443)
        .tlsConfig(tlsConfig)
        .build()

    server.distributor.register("/secure", {
        ctx =>
        match (ctx.clientCertificate) {
            case Some(certs) =>
                ctx.responseBuilder.body("mTLS OK, client cert count: ${certs.size}")
            case None =>
                ctx.responseBuilder.status(401).body("No client certificate")
        }
    })

    server.serve()
}
```

在 Handler 中通过 `ctx.clientCertificate` 可获取客户端提供的证书链（`?Array<X509Certificate>`），用于进一步的身份校验。

---

## 7. 注意事项

- HTTPS 需安装 **OpenSSL 3**，详见 `cangjie-stdx` Skill 下的 tls 文档
- 如果未安装 OpenSSL 3 或安装了低版本，运行时会抛出 `TlsException: Can not load openssl library or function xxx`
- 设置 `tlsConfig.supportedAlpnProtocols = ["h2"]` 可启用 HTTP/2；握手失败时自动回退 HTTP/1.1
- 生产环境建议配置证书热更新，支持证书轮换无需重启服务
