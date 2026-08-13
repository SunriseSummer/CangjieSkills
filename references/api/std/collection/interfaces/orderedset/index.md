<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.orderedset" parent="std.collection" -->
# OrderedSet<T>

[← std.collection](../../index.md)

`OrderedSet<T> <: Set<T>`

OrderedSet 接口提供了一组集合的相关操作，允许我们以可读写的方式操作内部元素。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: ?T`](prop-first.md) | 获取 OrderedSet 第一个元素。 |
| [`last: ?T`](prop-last.md) | 获取 OrderedSet 最后一个元素。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`backward(mark: T, inclusive!: Bool): Iterator<T>`](backward.md) | 获取从第一个元素小于等于 mark 的节点按降序遍历到 first 的迭代器。 |
| [`forward(mark: T, inclusive!: Bool): Iterator<T>`](forward.md) | 获取从第一个元素大于等于 mark 的节点按升序遍历到 last 结束的一个迭代器。 |
| [`removeFirst(): ?T`](removefirst.md) | 删除 OrderedSet 的第一个元素。 |
| [`removeLast(): ?T`](removelast.md) | 删除 OrderedSet 的最后一个元素。 |
