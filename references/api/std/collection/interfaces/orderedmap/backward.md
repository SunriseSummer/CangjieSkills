<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.orderedmap.backward" parent="std.collection.interface.orderedmap" -->
# OrderedMap<K, V>.backward

[← OrderedMap<K, V>](index.md)

## 签名

```cangjie role=signature
func backward(mark: K, inclusive!: Bool): Iterator<(K, V)>
```

获取从第一个键小于等于 mark 的节点按降序遍历到 first 的迭代器。

## 契约

功能：获取从第一个键小于等于 mark 的节点按降序遍历到 first 的迭代器。如果该节点的键等于 mark ，那么根据 `inclusive!` 确定是否包含该键对应的节点。

参数：

- mark: K - 用于确定从哪里开始的键。
- inclusive!: Bool - 当 mark 是迭代器的首个元素的 key 时，指定是否包含 mark 作为起始点。

返回值：

- Iterator\<(K, V)> - 迭代器。
