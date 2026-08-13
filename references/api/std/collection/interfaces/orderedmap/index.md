<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.orderedmap" parent="std.collection" -->
# OrderedMap<K, V>

[← std.collection](../../index.md)

`OrderedMap<K, V> <: Map<K, V>`

OrderedMap 接口提供了一种将键映射到值的方式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: ?(K, V)`](prop-first.md) | 获取 OrderedMap 第一个元素。 |
| [`last: ?(K, V)`](prop-last.md) | 获取 OrderedMap 最后一个元素。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`backward(mark: K, inclusive!: Bool): Iterator<(K, V)>`](backward.md) | 获取从第一个键小于等于 mark 的节点按降序遍历到 first 的迭代器。 |
| [`forward(mark: K, inclusive!: Bool): Iterator<(K, V)>`](forward.md) | 获取从第一个键大于等于 mark 的节点按升序遍历到 last 结束的一个迭代器。 |
| [`removeFirst(): ?(K, V)`](removefirst.md) | 删除 OrderedMap 的第一个元素。 |
| [`removeLast(): ?(K, V)`](removelast.md) | 删除 OrderedMap 的最后一个元素。 |
