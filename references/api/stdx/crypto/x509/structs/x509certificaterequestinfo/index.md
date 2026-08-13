<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.x509certificaterequestinfo" parent="stdx.crypto.x509" -->
# X509CertificateRequestInfo

[← stdx.crypto.x509](../../index.md)

`X509CertificateRequestInfo`

X509CertificateRequestInfo 结构包含了证书请求信息，包括证书实体可辨识名称、域名、email 地址和 IP 地址。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`IPAddresses: Array<IP>`](field-ipaddresses.md) | 记录证书签名请求的 IP 地址。 |
| [`dnsNames: Array<String>`](field-dnsnames.md) | 记录证书签名请求的 DNS 域名。 |
| [`emailAddresses: Array<String>`](field-emailaddresses.md) | 记录证书签名请求的 email 地址。 |
| [`subject: ?X509Name`](field-subject.md) | 记录证书签名请求的实体可辨识名称。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init( subject!: ?X509Name = None, dnsNames!: Array<String> = Array<String>(), emailAddresses!: Array<String> = Array<String>(), IPAddresses!: Array<IP> = Array<IP>() )`](init.md) | 构造 X509CertificateRequestInfo 对象。 |
