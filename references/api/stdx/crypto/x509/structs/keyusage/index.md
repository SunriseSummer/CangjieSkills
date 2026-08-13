<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.keyusage" parent="stdx.crypto.x509" -->
# KeyUsage

[← stdx.crypto.x509](../../index.md)

`KeyUsage <: ToString`

数字证书扩展字段中通常会包含携带公钥的用法说明，目前支持的用途有：DigitalSignature、NonRepudiation、KeyEncipherment、DataEncipherment、KeyAgreement、CertSign、CRLSign、EncipherOnly、DecipherOnly。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`CRLSign: UInt16 = 0x0002`](field-crlsign.md) | 表示私钥可用于对 CRL 签名，而公钥可用于验证 CRL 签名。 |
| [`CertSign: UInt16 = 0x0004`](field-certsign.md) | 表示私钥用于证书签名，而公钥用于验证证书签名，专用于 CA 证书。 |
| [`DataEncipherment: UInt16 = 0x0010`](field-dataencipherment.md) | 表示公钥用于直接加密数据。 |
| [`DecipherOnly: UInt16 = 0x0100`](field-decipheronly.md) | 表示证书中的公钥在密钥协商过程中，仅仅用于解密计算，配合 key Agreement 使用才有意义。 |
| [`DigitalSignature: UInt16 = 0x0080`](field-digitalsignature.md) | 表示私钥可以用于除了签发证书、签发 CRL 和非否认性服务的各种数字签名操作，而公钥用来验证这些签名。 |
| [`EncipherOnly: UInt16 = 0x0001`](field-encipheronly.md) | 表示证书中的公钥在密钥协商过程中，仅仅用于加密计算，配合 key Agreement 使用才有意义。 |
| [`KeyAgreement: UInt16 = 0x0008`](field-keyagreement.md) | 表示密钥用于密钥协商。 |
| [`KeyEncipherment: UInt16 = 0x0020`](field-keyencipherment.md) | 表示密钥用来加密传输其他的密钥。 |
| [`NonRepudiation: UInt16 = 0x0040`](field-nonrepudiation.md) | 表示私钥可以用于进行非否认性服务中的签名，而公钥用来验证签名。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(keys: UInt16)`](init.md) | 构造指定用途的扩展密钥用法，需要注意同一个密钥可以有多种用途。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 生成密钥用途字符串。 |
