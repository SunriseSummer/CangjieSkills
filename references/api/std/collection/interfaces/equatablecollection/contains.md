<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.equatablecollection.contains" parent="std.collection.interface.equatablecollection" -->
# EquatableCollection<T>.contains

[← EquatableCollection<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func contains(Collection<T>)

### 签名

```cangjie role=signature
func contains(all!: Collection<T>): Bool
```

判断 Keys 是否包含指定集合的所有元素。

### 契约

参数：

- all!: Collection\<T> - 待判断的集合 all。

返回值：

- Bool - 包含则返回 true，否则返回 false。

## func contains(T)

### 签名

```cangjie role=signature
func contains(element: T): Bool
```

判断 Keys 是否包含指定元素。

### 契约

参数：

- element: T - 指定元素，待判断 Keys 是否包含该元素。

返回值：

- Bool - 包含返回 true，否则返回 false。
