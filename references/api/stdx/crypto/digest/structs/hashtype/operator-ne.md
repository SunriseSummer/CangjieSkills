<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.struct.hashtype.operator-ne" parent="stdx.crypto.digest.struct.hashtype" -->
# HashType.!=

[← HashType](index.md)

## 签名

```cangjie role=signature
public override operator func !=(other: HashType): Bool
```

判断两 HashType 是否引用不同实例。

## 契约

参数：

- other: HashType - 对比的 HashType。

返回值：

- Bool - 不相同返回 `true`；否则，返回 `false`。
