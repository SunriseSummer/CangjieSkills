<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.common.enum.certificateverifymode.init" parent="stdx.net.tls.common.enum.certificateverifymode" -->
# CertificateVerifyMode.init

[← CertificateVerifyMode](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
CustomCA(Array<Certificate>)
```

表示根据提供的 CA 列表与系统 CA 进行验证。

## 重载 2

### 签名

```cangjie role=signature
CustomVerify((Array<Certificate>) -> Bool)
```

表示自定义验证规则。需要提供一个证书校验函数，根据传入的证书返回是否校验通过。

## 典型示例

`CertificateVerifyMode` 在 1.1.3 移至 `stdx.net.tls.common`，且 `CustomCA` 接受 `Array<Certificate>`：

```cangjie cjtest=run id=api.stdx.tls.custom-ca.run form=unit timeout=30s requires=stdx
package stdx_tls_custom_ca

import stdx.crypto.common.Certificate
import stdx.net.http.ClientBuilder
import stdx.net.tls.TlsClientConfig
import stdx.net.tls.common.CertificateVerifyMode

main(): Unit {
    var tls = TlsClientConfig()
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

```text cjtest=expect for=api.stdx.tls.custom-ca.run stream=stdout match=exact
0
```
