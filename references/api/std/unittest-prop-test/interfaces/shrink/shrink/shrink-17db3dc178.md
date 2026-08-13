<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-17db3dc178" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<String>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend String <: Shrink<String>](../extensions/extend-string-shrink-string.md)。

## 契约

返回值：

- Iterable\<String> - 一组可能的“较小”值的迭代器。
