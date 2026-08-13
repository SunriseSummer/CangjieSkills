<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.set.remove" parent="std.collection.interface.set" -->
# Set<T>.remove

[← Set<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove(Collection<T>)

### 签名

```cangjie role=signature
func remove(all!: Collection<T>): Unit
```

移除此 Set 中那些也包含在指定 Collection 中的所有元素。

### 契约

参数：

- all!: Collection\<T> - 传入 Collection\<T>。

## func remove(T)

### 签名

```cangjie role=signature
func remove(element: T): Bool
```

从该集合中移除指定元素（如果存在）。

### 契约

参数：

- element: T - 要删除的元素。

返回值：

- Bool - 集合中存在指定的元素并且删除成功返回 `true`，否则返回 `false` 。
