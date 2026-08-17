<!-- cj-doc kind="example-leaf" level="4" id="examples.security.tls-custom-ca" parent="examples.security" -->
# 为 HTTP 客户端配置 TLS 自定义 CA

[← 密码、TLS 与证书](index.md)

把解码后的证书放入 `CustomCA`，写入 `TlsClientConfig.verifyMode`，并通过 `ClientBuilder.tlsConfig` 装配客户端。

## 典型示例

枚举构造器使用类型名限定。把 `CustomCA` 赋给 `TlsClientConfig.verifyMode` 后，还必须通过 `ClientBuilder.tlsConfig` 交给 HTTP 客户端。实际连接应传入 `X509Certificate.decodeFromPem(pem)` 解码出的受信任 CA；下面用空数组只验证完整配置链，不表示空信任库可用于真实连接：

```cangjie cjtest=run id=examples.security.tls-custom-ca.api.stdx.tls.custom-ca.run form=unit timeout=30s requires=stdx
package stdx_tls_custom_ca

import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.Certificate
import stdx.net.http.Client
import stdx.net.http.ClientBuilder
import stdx.net.tls.common.CertificateVerifyMode
import stdx.net.tls.TlsClientConfig

public func clientWithCustomCA(pem: String): Client {
    let decoded = X509Certificate.decodeFromPem(pem)
    let certificates = Array<Certificate>(decoded.size, { index => decoded[index] })
    var tls = TlsClientConfig()
    tls.verifyMode = CertificateVerifyMode.CustomCA(certificates)
    return ClientBuilder().tlsConfig(tls).build()
}

main(): Unit {
    let _ = clientWithCustomCA
    var tls = TlsClientConfig()
    // 空数组只让离线测试检查装配链；真实连接调用 clientWithCustomCA(caPem)。
    tls.verifyMode = CertificateVerifyMode.CustomCA(Array<Certificate>())
    let client = ClientBuilder().tlsConfig(tls).build()

    match (client.getTlsConfig()) {
        case Some(config) =>
            match (config.verifyMode) {
                case CertificateVerifyMode.CustomCA(certificates) => println(certificates.size)
                case _ => println("system CA")
            }
        case None => println("missing TLS config")
    }
    client.close()
}
```

预期标准输出：

```text cjtest=expect for=examples.security.tls-custom-ca.api.stdx.tls.custom-ca.run stream=stdout match=exact
0
```
