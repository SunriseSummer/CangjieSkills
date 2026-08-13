<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.matchers.argthatnot" parent="std.unittest.mock.class.matchers" -->
# Matchers.argThatNot

[← Matchers](index.md)

## 签名

```cangjie role=signature
public static func argThatNot<T>(predicate: (T) -> Bool): TypedMatcher<T>
```

根据提供的过滤器闭包过滤输入值。

## 契约

参数：

- predicate: (T) ->Bool - 过滤器。

返回值：

- TypedMatcher\<T> - 参数过滤类型匹配器实例。
