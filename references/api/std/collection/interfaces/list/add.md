<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.list.add" parent="std.collection.interface.list" -->
# List<T>.add

[← List<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func add(Collection<T>)

### 签名

```cangjie role=signature
func add(all!: Collection<T>): Unit
```

将指定集合中的所有元素附加到此列表的末尾。

### 契约

参数：

- all!: Collection\<T> - 需要插入的元素的集合。

## func add(Collection<T>, Int64)

### 签名

```cangjie role=signature
func add(all!: Collection<T>, at!: Int64): Unit
```

从指定位置开始，将指定集合中的所有元素插入此列表。

### 契约

参数：

- all!: Collection\<T> - 要插入的 T 类型元素集合。
- at!: Int64 - 插入集合的目标索引。

## func add(T)

### 签名

```cangjie role=signature
func add(element: T): Unit
```

将指定的元素附加到此列表的末尾。

### 契约

参数：

- element: T - 插入的元素，类型为 T。

## func add(T, Int64)

### 签名

```cangjie role=signature
func add(element: T, at!: Int64): Unit
```

在此列表中的指定位置插入指定元素。

### 契约

参数：

- element: T - 要插入的 T 类型元素。
- at!: Int64 - 插入元素的目标索引。
