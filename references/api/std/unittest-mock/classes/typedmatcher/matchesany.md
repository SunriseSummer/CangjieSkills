<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.typedmatcher.matchesany" parent="std.unittest.mock.class.typedmatcher" -->
# TypedMatcher<T>.matchesAny

[← TypedMatcher<T>](index.md)

## 签名

```cangjie role=signature
public func matchesAny(arg: Any): Bool
```

检查入参类型是否与预期相符。

## 契约

参数：

- arg: Any - 待检查的入参。

返回值：

- Bool - 若类型匹配则返回 `true` ，否则返回 `false` 。
