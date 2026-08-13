<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.enum.certificateverifymode.value-customca-array-x509certificate" parent="stdx.net.tls.enum.certificateverifymode" -->
# CertificateVerifyMode.CustomCA(Array<X509Certificate>)

[← CertificateVerifyMode](index.md)

## 签名

```cangjie role=signature
CustomCA(Array<X509Certificate>)
```

表示根据提供的 CA 列表与系统 CA 进行验证。

## 典型示例

枚举构造器使用类型名限定。把 `CustomCA` 赋给 `TlsClientConfig.verifyMode` 后，还必须通过 `ClientBuilder.tlsConfig` 交给 HTTP 客户端。实际连接应传入 `X509Certificate.decodeFromPem(pem)` 解码出的受信任 CA；下面用空数组只验证完整配置链，不表示空信任库可用于真实连接：

```cangjie cjtest=run id=api.stdx.tls.custom-ca.run form=unit timeout=30s requires=stdx
package stdx_tls_custom_ca

import stdx.crypto.x509.X509Certificate
import stdx.net.http.Client
import stdx.net.http.ClientBuilder
import stdx.net.tls.CertificateVerifyMode
import stdx.net.tls.TlsClientConfig

public func clientWithCustomCA(pem: String): Client {
    let certificates = X509Certificate.decodeFromPem(pem)
    var tls = TlsClientConfig()
    tls.verifyMode = CertificateVerifyMode.CustomCA(certificates)
    return ClientBuilder().tlsConfig(tls).build()
}

main(): Unit {
    var tls = TlsClientConfig()
    // 空数组只让离线测试检查装配链；真实连接调用 clientWithCustomCA(caPem)。
    tls.verifyMode = CertificateVerifyMode.CustomCA(Array<X509Certificate>())
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

```text cjtest=expect for=api.stdx.tls.custom-ca.run stream=stdout match=exact
0
```
