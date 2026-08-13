<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.enum.signaturealgorithm.operator-ne" parent="stdx.crypto.x509.enum.signaturealgorithm" -->
# SignatureAlgorithm.!=

[← SignatureAlgorithm](index.md)

## 签名

```cangjie role=signature
public override operator func !=(other: SignatureAlgorithm): Bool
```

判不等。

## 契约

参数：

- other: SignatureAlgorithm - 被比较的签名算法。

返回值：

- Bool - 若签名算法不同，返回 true；否则，返回 false。
