<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.backward" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.backward

[← TreeSet<T> where T <: Comparable<T>](index.md)

## 签名

```cangjie role=signature
public func backward(mark: T, inclusive!: Bool = true): Iterator<T>
```

获取从第一个键小于等于 mark 的节点按降序遍历到 first 的迭代器。

## 契约

功能：获取从第一个键小于等于 mark 的节点按降序遍历到 first 的迭代器。如果该节点的键等于 mark ，那么根据 `inclusive!` 确定是否包含该键对应的节点。

参数：

- mark: T - 用于确定从哪里开始的元素。
- inclusive!: Bool - 当 `mark` 是迭代器的首个元素时，指定是否包含 mark 作为起始点，默认为 `true`。

返回值：

- Iterator\<T> - 对应元素的迭代器。
