<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.x509certificaterequestinfo.init" parent="stdx.crypto.x509.struct.x509certificaterequestinfo" -->
# X509CertificateRequestInfo.init

[← X509CertificateRequestInfo](index.md)

## 签名

```cangjie role=signature
public init(
    subject!: ?X509Name = None,
    dnsNames!: Array<String> = Array<String>(),
    emailAddresses!: Array<String> = Array<String>(),
    IPAddresses!: Array<IP> = Array<IP>()
)
```

构造 X509CertificateRequestInfo 对象。

## 契约

参数：

- subject!: ?X509Name - 数字证书的使用者信息，默认值为 None。
- dnsNames!: Array\<String> - 域名列表，需要用户保证输入域名的有效性，默认值为空的字符串数组。
- emailAddresses!: Array\<String> - email 地址列表，需要用户保证输入 email 的有效性，默认值为空的字符串数组。
- IPAddresses!: Array\<IP> - IP 地址列表，默认值为空的 IP 数组。

异常：

- X509Exception - 输入的 IP 地址列表中包含无效的 IP 地址，则抛出异常。
