<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.readonlyset.contains" parent="std.collection.interface.readonlyset" -->
# ReadOnlySet<T>.contains

[← ReadOnlySet<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func contains(Collection<T>)

### 签名

```cangjie role=signature
func contains(all!: Collection<T>): Bool
```

检查该集合是否包含其他集合。

### 契约

参数：

- all!: Collection\<T> - 其他集合。

返回值：

- Bool - 如果该集合包含指定集合，则返回 true；否则，返回 false。

## func contains(T)

### 签名

```cangjie role=signature
func contains(element: T): Bool
```

如果该集合包含指定元素，则返回 true。

### 契约

参数：

- element: T - 需要判断的元素。

返回值：

- Bool - 如果包含，则返回 true；否则，返回 false。
