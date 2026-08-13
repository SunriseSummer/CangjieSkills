<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.enum.signaturetype.operator-ne" parent="stdx.net.tls.enum.signaturetype" -->
# SignatureType.!=

[← SignatureType](index.md)

## 签名

```cangjie role=signature
public operator func !=(other: SignatureType) : Bool
```

判断两者是否为不同的签名算法。

## 契约

参数：

- other: SignatureType - 对比的签名算法类型。

返回值：

- Bool - 不相同返回 `true`；否则，返回 `false`。
