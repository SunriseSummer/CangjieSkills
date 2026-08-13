<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.class.x509certificate.verify" parent="stdx.crypto.x509.class.x509certificate" -->
# X509Certificate.verify

[← X509Certificate](index.md)

## 签名

```cangjie role=signature
public func verify(verifyOption: VerifyOption): Bool
```

根据验证选项验证当前证书的有效性。

## 契约

验证优先级：

1. 优先验证有效期；
2. 可选验证 DNS 域名；
3. 最后根据根证书和中间证书验证其有效性。

参数：

- verifyOption: VerifyOption - 证书验证选项。

返回值：

- Bool - 证书有效返回 true，否则返回 false。

异常：

- X509Exception - 检验过程中失败，比如内存分配异常等内部错误，则抛出异常。
