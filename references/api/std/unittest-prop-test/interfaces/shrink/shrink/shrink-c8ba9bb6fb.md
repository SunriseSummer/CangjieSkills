<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-c8ba9bb6fb" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<UInt16>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend UInt16 <: Shrink<UInt16>](../extensions/extend-uint16-shrink-uint16.md)。

## 契约

返回值：

- Iterable\<UInt16> - 一组可能的“较小”值的迭代器。
