<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.matchers.oftype" parent="std.unittest.mock.class.matchers" -->
# Matchers.ofType

[← Matchers](index.md)

## 签名

```cangjie role=signature
public static func ofType<T>(): TypedMatcher<T>
```

根据类型过滤输入值。

## 契约

返回值：

- TypedMatcher\<T> - 仅允许特定类型的类型匹配器。
