<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.set.add" parent="std.collection.interface.set" -->
# Set<T>.add

[← Set<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func add(Collection<T>)

### 签名

```cangjie role=signature
func add(all!: Collection<T>): Unit
```

添加 Collection 中的所有元素至此 Set 中，如果元素存在，则不添加。

### 契约

参数：

- all!: Collection\<T> - 需要被添加的元素的集合。

## func add(T)

### 签名

```cangjie role=signature
func add(element: T): Bool
```

添加元素操作。

### 契约

功能：添加元素操作。如果元素已经存在，则不会添加它。

参数：

- element: T - 要添加的元素。

返回值：

- Bool - 如果添加成功，则返回 true；否则，返回 false。
