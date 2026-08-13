<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.class.x509certificaterequest.init" parent="stdx.crypto.x509.class.x509certificaterequest" -->
# X509CertificateRequest.init

[← X509CertificateRequest](index.md)

## 签名

```cangjie role=signature
public init(
    privateKey: PrivateKey,
    certificateRequestInfo!: ?X509CertificateRequestInfo = None,
    signatureAlgorithm!: ?SignatureAlgorithm = None
)
```

创建数字证书签名请求对象。

## 契约

参数：

- privateKey: PrivateKey - 私钥，仅支持 RSA、ECDSA 和 DSA 私钥。
- certificateRequestInfo!: ?X509CertificateRequestInfo - 数字证书签名信息，默认值为 None。
- signatureAlgorithm!: ?SignatureAlgorithm - 证书签名算法，默认值为 None，使用默认值时默认的摘要类型是 SHA256。

异常：

- X509Exception - 私钥类型不支持、私钥类型和证书签名算法中的私钥类型不匹配或数字证书签名信息设置失败时，抛出异常。
