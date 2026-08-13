<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.matchers.default" parent="std.unittest.mock.class.matchers" -->
# Matchers.default

[← Matchers](index.md)

## 签名

```cangjie role=signature
public static func default<T>(target: T): TypedMatcher<T>
```

根据结构（更高优先级）或引用相等性来匹配值。

## 契约

功能：根据结构（更高优先级）或引用相等性来匹配值。如果传入的参数既不是 Equatable\<T> 也不是引用类型，则会在运行时抛出异常（编译期不做检查）。

参数：

- target: T - 必须通过结构或引用相等来匹配的匹配对象。

返回值：

- TypedMatcher\<T> - 默认类型匹配器。

异常：

- MockFrameworkException - 如果参数 target 既不是 Equatable\<T> 类型也不是引用类型，则抛出异常。
