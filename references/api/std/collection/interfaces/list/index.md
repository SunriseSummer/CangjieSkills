<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.list" parent="std.collection" -->
# List<T>

[← std.collection](../../index.md)

`List<T> <: ReadOnlyList<T>`

定义了只提供对索引友好操作的列表类型。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(all!: Collection<T>): Unit`](add.md) | 将指定集合中的所有元素附加到此列表的末尾。 |
| [`add(all!: Collection<T>, at!: Int64): Unit`](add.md) | 从指定位置开始，将指定集合中的所有元素插入此列表。 |
| [`add(element: T): Unit`](add.md) | 将指定的元素附加到此列表的末尾。 |
| [`add(element: T, at!: Int64): Unit`](add.md) | 在此列表中的指定位置插入指定元素。 |
| [`clear(): Unit`](clear.md) | 从此列表中删除所有元素。 |
| [`remove(at!: Int64): T`](remove.md) | 删除此列表中指定位置的元素。 |
| [`remove(range: Range<Int64>): Unit`](remove.md) | 删除此列表中 Range 范围所包含的所有元素。 |
| [`removeIf(predicate: (T) -> Bool): Unit`](removeif.md) | 删除此列表中满足给定 lambda 表达式或函数的所有元素。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](index: Int64, value!: T): Unit`](operator-indexer.md) | 操作符重载 - set，通过下标运算符用指定的元素替换此列表中指定位置的元素。 |
