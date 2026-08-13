<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-f8790f50df" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<UInt8>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend UInt8 <: Shrink<UInt8>](../extensions/extend-uint8-shrink-uint8.md)。

## 契约

返回值：

- Iterable\<UInt8> - 一组可能的“较小”值的迭代器。
