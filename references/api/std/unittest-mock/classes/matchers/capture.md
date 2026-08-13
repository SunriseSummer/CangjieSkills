<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.matchers.capture" parent="std.unittest.mock.class.matchers" -->
# Matchers.capture

[← Matchers](index.md)

## 签名

```cangjie role=signature
public static func capture<T>(listener: ValueListener<T>): TypedMatcher<T>
```

允许 listener 值监听器对类型为 T 的传入参数值进行处理。

## 契约

功能：允许 listener 值监听器对类型为 T 的传入参数值进行处理。当 capture 的类型参数未指定时，将使用值监听器的类型参数值。

参数：

- listener: ValueListener\<T> - 值监听器。

返回值：

- TypedMatcher\<T> - 拥有值监听器的类型匹配器。

注意：值监听器不允许在 @Called 的参数范围内使用。
