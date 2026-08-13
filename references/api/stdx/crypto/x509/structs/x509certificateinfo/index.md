<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.x509certificateinfo" parent="stdx.crypto.x509" -->
# X509CertificateInfo

[← stdx.crypto.x509](../../index.md)

`X509CertificateInfo`

X509CertificateInfo 结构包含了证书信息，包括证书序列号、有效期、实体可辨识名称、域名、email 地址、IP 地址、密钥用法和扩展密钥用法。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`IPAddresses: Array<IP>`](field-ipaddresses.md) | 记录证书的 IP 地址。 |
| [`dnsNames: Array<String>`](field-dnsnames.md) | 记录证书的 DNS 域名。 |
| [`emailAddresses: Array<String>`](field-emailaddresses.md) | 记录证书的 email 地址。 |
| [`extKeyUsage: ?ExtKeyUsage`](field-extkeyusage.md) | 记录证书的扩展密钥用法。 |
| [`keyUsage: ?KeyUsage`](field-keyusage.md) | 记录证书的密钥用法。 |
| [`notAfter: DateTime`](field-notafter.md) | 记录证书有效期的结束日期。 |
| [`notBefore: DateTime`](field-notbefore.md) | 记录证书有效期的起始日期。 |
| [`serialNumber: SerialNumber`](field-serialnumber.md) | 记录证书的序列号。 |
| [`subject: ?X509Name`](field-subject.md) | 记录证书实体可辨识名称。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init( serialNumber!: ?SerialNumber = None, notBefore!: ?DateTime = None, notAfter!: ?DateTime = None, subject!: ?X509Name = None, dnsNames!: Array<String> = Array<String>(), emailAddresses!: Array<String> = Array<String>(), IPAddresses!: Array<IP> = Array<IP>(), keyUsage!: ?KeyUsage = None, extKeyUsage!: ?ExtKeyUsage = None )`](init.md) | 构造 X509CertificateInfo 对象。 |
