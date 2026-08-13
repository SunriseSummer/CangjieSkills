<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.matchers.same" parent="std.unittest.mock.class.matchers" -->
# Matchers.same

[← Matchers](index.md)

## 签名

```cangjie role=signature
public static func same<T>(target: T): TypedMatcher<T> where T <: Object
```

根据与所提供对象的引用相等性来过滤输入值。

## 契约

参数：

- target: T - 匹配对象。

返回值：

- TypedMatcher\<T> - 仅允许与给定对象引用相等的参数的参数匹配器。
