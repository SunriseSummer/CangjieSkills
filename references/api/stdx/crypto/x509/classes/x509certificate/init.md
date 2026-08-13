<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.class.x509certificate.init" parent="stdx.crypto.x509.class.x509certificate" -->
# X509Certificate.init

[← X509Certificate](index.md)

## 签名

```cangjie role=signature
public init(
    certificateInfo: X509CertificateInfo,
    parent!: X509Certificate,
    publicKey!: PublicKey,
    privateKey!: PrivateKey,
    signatureAlgorithm!: ?SignatureAlgorithm = None
)
```

创建数字证书对象。

## 契约

参数：

- certificateInfo: X509CertificateInfo - 数字证书配置信息。
- parent!: X509Certificate - 颁发者证书。
- publicKey!: PublicKey - 申请人公钥，仅支持 RSA、ECDSA 和 DSA 公钥。
- privateKey!: PrivateKey - 颁发者私钥，仅支持 RSA、ECDSA 和 DSA 私钥。
- signatureAlgorithm!: ?SignatureAlgorithm - 证书签名算法，默认值为 None，使用默认值时默认的摘要类型是 SHA256。

异常：

- X509Exception - 公钥或私钥类型不支持、私钥类型和证书签名算法中的私钥类型不匹配或数字证书信息设置失败时，抛出异常。
