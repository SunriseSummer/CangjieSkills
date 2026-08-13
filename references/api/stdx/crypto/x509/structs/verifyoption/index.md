<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.verifyoption" parent="stdx.crypto.x509" -->
# VerifyOption

[← stdx.crypto.x509](../../index.md)

`VerifyOption`

用于为 `x509` 证书验证函数 verify 提供配置选项。

## 关键契约

构造与赋值：

- 仓颉 1.0.5 / stdx 1.0.5.1 仅支持零参构造 `var option = VerifyOption()`，不支持 `VerifyOption(roots: ..., time: ...)` 这类命名参数构造。
- 构造后逐项给 `roots`、`intermediates`、`dnsName`、`time` 赋值；未赋值时分别使用本页列出的默认值。
- 自定义信任或可重复验证应显式设置 `roots` 与 `time`，避免隐式使用系统根证书和当前时间。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`dnsName: String = ""`](field-dnsname.md) | 校验域名，默认为空，只有设置域名时才会进行此处校验。 |
| [`intermediates: Array<X509Certificate> = Array<X509Certificate>()`](field-intermediates.md) | 中间证书链，默认为空。 |
| [`roots: Array<X509Certificate> = X509Certificate.systemRootCerts()`](field-roots.md) | 根证书链，默认为系统根证书链。 |
| [`time: DateTime = DateTime.now()`](field-time.md) | 校验时间，默认为创建选项的时间。 |
