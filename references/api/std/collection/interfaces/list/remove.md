<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.list.remove" parent="std.collection.interface.list" -->
# List<T>.remove

[← List<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove(Int64)

### 签名

```cangjie role=signature
func remove(at!: Int64): T
```

删除此列表中指定位置的元素。

### 契约

参数：

- at!: Int64 - 被删除元素的索引。

返回值：

- T - 被移除的元素。

## func remove(Range<Int64>)

### 签名

```cangjie role=signature
func remove(range: Range<Int64>): Unit
```

删除此列表中 Range 范围所包含的所有元素。

### 契约

参数：

- range: Range\<Int64> - 需要被删除的元素的范围。
