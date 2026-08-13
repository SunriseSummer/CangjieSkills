<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.extkeyusage" parent="stdx.crypto.x509" -->
# ExtKeyUsage

[← stdx.crypto.x509](../../index.md)

`ExtKeyUsage <: ToString`

数字证书扩展字段中通常会包含携带扩展密钥用法说明，目前支持的用途有：ServerAuth、ClientAuth、EmailProtection、CodeSigning、OCSPSigning、TimeStamping。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`AnyKey: UInt16 = 0`](field-anykey.md) | 表示应用于任意用途。 |
| [`ClientAuth: UInt16 = 2`](field-clientauth.md) | 表示用于 SSL 的客户端验证。 |
| [`CodeSigning: UInt16 = 4`](field-codesigning.md) | 表示用于代码签名。 |
| [`EmailProtection: UInt16 = 3`](field-emailprotection.md) | 表示用于电子邮件的加解密、签名等。 |
| [`OCSPSigning: UInt16 = 5`](field-ocspsigning.md) | 用于对 OCSP 响应包进行签名。 |
| [`ServerAuth: UInt16 = 1`](field-serverauth.md) | 表示用于 SSL 的服务端验证。 |
| [`TimeStamping: UInt16 = 6`](field-timestamping.md) | 用于将对象摘要值与时间绑定。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(keys: Array<UInt16>)`](init.md) | 构造指定用途的扩展密钥用法，需要注意同一个密钥可以有多种用途。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 生成扩展密钥用途字符串。 |
