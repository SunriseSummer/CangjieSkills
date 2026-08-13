<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.typedmatcher.matches" parent="std.unittest.mock.class.typedmatcher" -->
# TypedMatcher<T>.matches

[← TypedMatcher<T>](index.md)

## 签名

```cangjie role=signature
public func matches(arg: T): Bool
```

检查入参类型是否与预期相符。

## 契约

参数：

- arg: T - 待检查的入参。

返回值：

- Bool - 若类型匹配则返回 `true` ，否则返回 `false` 。
