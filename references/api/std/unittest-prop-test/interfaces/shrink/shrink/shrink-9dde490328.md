<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-9dde490328" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<Int16>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend Int16 <: Shrink<Int16>](../extensions/extend-int16-shrink-int16.md)。

## 契约

返回值：

- Iterable\<Int16> - 一组可能的“较小”值的迭代器。
