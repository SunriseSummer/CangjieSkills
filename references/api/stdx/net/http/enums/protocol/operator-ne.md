<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.enum.protocol.operator-ne" parent="stdx.net.http.enum.protocol" -->
# Protocol.!=

[← Protocol](index.md)

## 签名

```cangjie role=signature
public override operator func !=(that: Protocol): Bool
```

判断枚举值是否不相等。

## 契约

参数：

- that: Protocol - 被比较的枚举值。

返回值：

- Bool - 当前实例与 `that` 不等，返回 `true`；否则返回 `false`。
