<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.matchers.eq" parent="std.unittest.mock.class.matchers" -->
# Matchers.eq

[← Matchers](index.md)

## 签名

```cangjie role=signature
public static func eq<T>(target: T): TypedMatcher<T> where T <: Equatable<T>
```

根据与提供的值的结构相等性过滤输入值。

## 契约

参数：

- target: T - 匹配对象。

返回值：

- TypedMatcher\<T> - 仅允许结构上等于给定值的参数匹配器。
