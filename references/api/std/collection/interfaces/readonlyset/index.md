<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.readonlyset" parent="std.collection" -->
# ReadOnlySet<T>

[← std.collection](../../index.md)

`ReadOnlySet<T> <: Collection<T>`

ReadOnlySet 接口提供了一组集合的相关操作，允许我们以只读方式操作内部元素。

## 方法

| 签名 | 功能 |
|---|---|
| [`contains(all!: Collection<T>): Bool`](contains.md) | 检查该集合是否包含其他集合。 |
| [`contains(element: T): Bool`](contains.md) | 如果该集合包含指定元素，则返回 true。 |
| [`subsetOf(other: ReadOnlySet<T>): Bool`](subsetof.md) | 检查该集合是否为其他集合的子集。 |
