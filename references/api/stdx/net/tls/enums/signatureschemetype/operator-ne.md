<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.enum.signatureschemetype.operator-ne" parent="stdx.net.tls.enum.signatureschemetype" -->
# SignatureSchemeType.!=

[← SignatureSchemeType](index.md)

## 签名

```cangjie role=signature
public operator func !=(other: SignatureSchemeType): Bool
```

判断两者是否为不同加密算法类型。

## 契约

参数：

- other: SignatureSchemeType - 对比的加密算法类型。

返回值：

- Bool - 不相同返回 true；否则，返回 false。
