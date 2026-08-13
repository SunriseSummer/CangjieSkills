<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.add" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.add

[← TreeSet<T> where T <: Comparable<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func add(Collection<T>)

### 签名

```cangjie role=signature
public func add(all!: Collection<T>): Unit
```

添加 Collection 中的所有元素至此 TreeSet 中，如果元素存在，则不添加。

### 契约

参数：

- all!: Collection\<T> - 需要被添加的元素的集合。

## func add(T)

### 签名

```cangjie role=signature
public func add(element: T): Bool
```

将新的元素放入 TreeSet 中。

### 契约

功能：将新的元素放入 TreeSet 中。若添加的元素在 TreeSet 中存在，则添加失败。

参数：

- element: T - 指定的元素。

返回值：

- Bool - 如果添加成功，则返回 true；否则，返回 false。
