<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.signature.operator-ne" parent="stdx.crypto.x509.struct.signature" -->
# Signature.!=

[← Signature](index.md)

## 签名

```cangjie role=signature
public override operator func !=(other: Signature): Bool
```

判不等。

## 契约

参数：

- other: Signature - 被比较的证书签名。

返回值：

- Bool - 若证书签名不同，返回 true；否则，返回 false。
