<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-728d154d8f" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<HashSet<T>>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend<T> HashSet<T> <: Shrink<HashSet<T>>](../extensions/extend-t-hashset-t-shrink-hashset-t.md)。

## 契约

返回值：

- Iterable\<HashSet\<T>> - 一组可能的“较小”值的迭代器。
