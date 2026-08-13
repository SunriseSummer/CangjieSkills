<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.remove" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.remove

[← TreeSet<T> where T <: Comparable<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove(Collection<T>)

### 签名

```cangjie role=signature
public func remove(all!: Collection<T>): Unit
```

移除此 TreeSet 中那些也包含在指定 Collection 中的所有元素。

### 契约

参数：

- all!: Collection\<T> - 需要从此 TreeSet 中移除的元素的集合。

## func remove(T)

### 签名

```cangjie role=signature
public func remove(element: T): Bool
```

如果指定元素存在于此 TreeSet 中，则将其移除。

### 契约

参数：

- element: T - 需要被移除的元素。

返回值：

- Bool - true，表示移除成功；false，表示移除失败。
