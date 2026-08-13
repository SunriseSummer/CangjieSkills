<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-bb3253a332" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<UInt64>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend UInt64 <: Shrink<UInt64>](../extensions/extend-uint64-shrink-uint64.md)。

## 契约

返回值：

- Iterable\<UInt64> - 一组可能的“较小”值的迭代器。
