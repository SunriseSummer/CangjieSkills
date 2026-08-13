<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-ea784a7282" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<UInt32>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend UInt32 <: Shrink<UInt32>](../extensions/extend-uint32-shrink-uint32.md)。

## 契约

返回值：

- Iterable\<UInt32> - 一组可能的“较小”值的迭代器。
