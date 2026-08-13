<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.orderedset.backward" parent="std.collection.interface.orderedset" -->
# OrderedSet<T>.backward

[← OrderedSet<T>](index.md)

## 签名

```cangjie role=signature
func backward(mark: T, inclusive!: Bool): Iterator<T>
```

获取从第一个元素小于等于 mark 的节点按降序遍历到 first 的迭代器。

## 契约

功能：获取从第一个元素小于等于 mark 的节点按降序遍历到 first 的迭代器。如果该节点的元素等于 mark ，那么根据 `inclusive!` 确定是否包含该元素对应的节点。

参数：

- mark: T - 用于确定从哪里开始的元素。
- inclusive!: Bool - 当 mark 是迭代器的首个元素时，指定是否包含 mark 作为起始点。

返回值：

- Iterator\<T> - 迭代器。
