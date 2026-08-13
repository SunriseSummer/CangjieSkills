<!-- cj-doc kind="example-leaf" level="4" id="examples.security.x509-verify-option" parent="examples.security" -->
# 配置可重复的 X.509 验证

[← 密码、TLS 与证书](index.md)

零参构造 VerifyOption，再显式设置根证书、域名和验证时间，避免环境默认值造成不确定性。

## 典型示例

`VerifyOption` 先零参构造，再逐字段配置。下面固定根证书集合、域名和验证时间；实际调用时把受信 CA 解码后的数组传入 `makeVerifyOption`。

```cangjie cjtest=run id=api.stdx.x509.verify-option.run form=unit timeout=30s requires=stdx
package stdx_x509_verify_option

import std.time.DateTime
import stdx.crypto.x509.VerifyOption
import stdx.crypto.x509.X509Certificate

func makeVerifyOption(roots: Array<X509Certificate>): VerifyOption {
    var option = VerifyOption()
    option.roots = roots
    option.intermediates = Array<X509Certificate>()
    option.dnsName = "sync.local.test"
    option.time = DateTime.ofUTC(year: 2030, month: 6, dayOfMonth: 15)
    return option
}

main(): Unit {
    let option = makeVerifyOption(Array<X509Certificate>())
    println("${option.dnsName}:${option.roots.size}")
}
```

预期标准输出：

```text cjtest=expect for=api.stdx.x509.verify-option.run stream=stdout match=exact
sync.local.test:0
```
