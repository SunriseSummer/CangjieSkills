<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.enum.signaturealgorithm.operator-ne" parent="stdx.net.tls.enum.signaturealgorithm" -->
# SignatureAlgorithm.!=

[← SignatureAlgorithm](index.md)

## 签名

```cangjie role=signature
public operator func !=(other: SignatureAlgorithm) : Bool
```

判断签名算法类型是否不同。

## 契约

参数：

- other: SignatureAlgorithm - 对比的签名算法类型。

返回值：

- Bool - 不相同返回 `true`；否则，返回 `false`。
