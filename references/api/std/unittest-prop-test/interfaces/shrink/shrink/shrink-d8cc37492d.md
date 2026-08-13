<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-d8cc37492d" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<Array<T>>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend<T> Array<T> <: Shrink<Array<T>>](../extensions/extend-t-array-t-shrink-array-t.md)。

## 契约

返回值：

- Iterable\<Array\<T>> - 一组可能的“较小”值的迭代器。
