# HTTPS/TLS 客户端配置（stdx.net.http + stdx.net.tls）

本文档详细介绍 HTTP 客户端的 HTTPS/TLS 配置。核心 HTTP 客户端用法请参阅 [README.md](./README.md)。

---

## 1. TlsClientConfig 配置

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

---

## 2. 证书验证模式（CertificateVerifyMode）

| 模式 | 说明 | 适用场景 |
|------|------|----------|
| `Default` | 使用系统 CA 验证服务端证书 | **生产环境**（默认） |
| `CustomCA(certs)` | 使用自定义 CA 列表验证 | 自签名证书或私有 CA |
| `TrustAll` | 信任所有证书，不验证 | **仅限开发测试** |

---

## 3. TrustAll 快速入门（仅测试用）

> **⚠️ 警告**：`TrustAll` 模式跳过证书验证，**仅限开发测试环境使用**，生产环境请使用 `Default` 或 `CustomCA` 模式。

```cangjie
import stdx.net.http.*
import stdx.net.tls.*

main() {
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = TrustAll

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    let resp = client.get("https://127.0.0.1:8443/api")
    println("Status: ${resp.status}")

    client.close()
}
```

---

## 4. 使用自定义 CA 证书（CustomCA 模式）

适用于自签名证书或内部私有 CA 的场景。需要提供 CA 证书文件（PEM 格式）。

```cangjie
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.*
import std.fs.*

main() {
    // 加载自定义 CA 证书（用户需提供 ca.crt 文件）
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

> **说明**：`ca.crt` 文件为 PEM 格式的 CA 证书，需由用户根据实际环境提供。

---

## 5. 启用 HTTP/2（ALPN）

HTTP/2 需要 TLS + ALPN `h2` 配置。如果握手失败，自动回退 HTTP/1.1。

```cangjie
import stdx.net.http.*
import stdx.net.tls.*

main() {
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = TrustAll
    tlsConfig.alpnProtocolsList = ["h2"]

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    let resp = client.get("https://127.0.0.1:8443/api")
    println("Protocol: ${resp.version}")
    println("Status: ${resp.status}")

    client.close()
}
```

> **说明**：不支持通过 `Upgrade: h2c` 从 HTTP/1.1 升级到 HTTP/2。必须通过 TLS ALPN 协商。

---

## 6. 双向 TLS 认证（客户端证书）

当服务端要求客户端提供证书时，需配置客户端证书链和私钥。证书文件需由用户根据实际环境提供。

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
    tlsConfig.clientCertificate = (clientCerts, clientPrivateKey)

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    let resp = client.get("https://secure.example.com/api")
    println(StringReader(resp.body).readToEnd())

    client.close()
}
```

> **说明**：`ca.crt`、`client.crt`、`client.key` 文件需由用户根据实际环境提供。`clientCertificate` 的值为证书链数组和私钥的元组。

---

## 7. HTTP/2 Server Push 接收

当服务端使用 HTTP/2 Server Push 主动推送资源时，客户端可通过 `resp.getPush()` 获取推送的响应。

```cangjie
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.*
import std.fs.*

main() {
    // 加载 CA 证书（用户需提供 ca.crt 文件）
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

> **说明**：使用 `enablePush(false)` 可禁用 Server Push 接收。

---

## 8. 高级 TLS 配置

可以精细控制 TLS 版本、密码套件等参数。

```cangjie
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

    let resp = client.get("https://127.0.0.1:8443/api")
    println("Status: ${resp.status}")

    client.close()
}
```

---

## 9. 异常处理

HTTPS 相关异常：

| 异常 | 说明 |
|------|------|
| `TlsException` | TLS 握手或通信异常（证书无效、OpenSSL 未安装等） |
| `HttpException` | HTTP 协议异常 |

> **注意**：HTTPS 场景如果未安装 OpenSSL 3 或安装了低版本，运行时会抛出 `TlsException: Can not load openssl library or function xxx`。详见 `cangjie-stdx` Skill 下的 tls 文档。

---

## 10. 速查

| 操作 | 用法 |
|------|------|
| 启用 HTTPS | `ClientBuilder().tlsConfig(tlsConfig)` |
| 系统 CA 验证 | `tlsConfig.verifyMode = Default`（默认值） |
| 自定义 CA | `tlsConfig.verifyMode = CustomCA(certs)` |
| 跳过验证（测试） | `tlsConfig.verifyMode = TrustAll`（**仅测试用**） |
| 启用 HTTP/2 | `tlsConfig.alpnProtocolsList = ["h2"]` |
| 双向认证 | `tlsConfig.clientCertificate = (certChain, privateKey)` |
| Server Push | `resp.getPush()` 获取推送；`enablePush(false)` 禁用 |
| OpenSSL 依赖 | HTTPS 需安装 OpenSSL 3 |
