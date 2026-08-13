<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.readonlylist.get" parent="std.collection.interface.readonlylist" -->
# ReadOnlyList<T>.get

[← ReadOnlyList<T>](index.md)

## 签名

```cangjie role=signature
func get(index: Int64): ?T
```

返回此列表中指定位置的元素。

## 契约

参数：

- index: Int64 - 要返回的元素的索引。

返回值：

- ?T - 返回指定位置的元素，如果 index 大小小于 0 或者大于等于此列表中的元素数量，返回 None。
