<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.forward" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.forward

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public func forward(mark: K, inclusive!: Bool = true): Iterator<(K, V)>
```

获取从第一个键大于等于 mark 的节点按升序遍历到 last 结束的一个迭代器。

## 契约

功能：获取从第一个键大于等于 mark 的节点按升序遍历到 last 结束的一个迭代器。如果该节点的键等于 mark ，那么根据 `inclusive!` 确定是否包含该键对应的节点。

参数：

- mark: K - 用于确定从哪里开始的键。
- inclusive!: Bool - 当 `mark` 是迭代器的首个元素的 key 时，指定是否包含 mark 作为起始点，默认为 `true`。

返回值：

- Iterator\<(K, V)> - 对应元素的迭代器。
