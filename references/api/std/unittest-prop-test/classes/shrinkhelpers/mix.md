<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.shrinkhelpers.mix" parent="std.unittest.prop_test.class.shrinkhelpers" -->
# ShrinkHelpers.mix

[← ShrinkHelpers](index.md)

## 签名

```cangjie role=signature
public static func mix<T>(iterables: Array<Iterable<T>>): Iterable<T>
```

将迭代器列表混合为一个迭代器。

## 契约

参数：

- iterables: Array\<Iterable\<T>> - 待混合的列表。

返回值：

- Iterable\<T> - 混合后的迭代器。
