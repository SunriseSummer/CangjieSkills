<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-5be53eae6b" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<ArrayList<T>>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend<T> ArrayList<T> <: Shrink<ArrayList<T>>](../extensions/extend-t-arraylist-t-shrink-arraylist-t.md)。

## 契约

返回值：

- Iterable\<ArrayList\<T>> - 一组可能的“较小”值的迭代器。
