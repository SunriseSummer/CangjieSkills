<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.indexof" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.indexOf

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func indexOf(Array<T>)

### 签名

```cangjie role=signature
public func indexOf(elements: Array<T>): Option<Int64>
```

返回数组中子数组 `elements` 出现的第一个位置，如果数组中不包含此数组，返回 None。

### 契约

> **注意：**
>
> 当 T 的类型是 Int64 时，此函数的变长参数语法糖版本可能会和 `public func indexOf(element: T, fromIndex: Int64): Option<Int64>` 产生歧义，根据优先级，当参数数量是 2 个时，会优先调用 `public func indexOf(element: T, fromIndex: Int64): Option<Int64>`。

参数：

- elements: Array\<T> - 需要定位的目标数组。

返回值：

- Option\<Int64> - 数组中子数组 `elements` 出现的第一个位置，如果数组中不包含此数组，返回 None。

## func indexOf(Array<T>, Int64)

### 签名

```cangjie role=signature
public func indexOf(elements: Array<T>, fromIndex: Int64): Option<Int64>
```

返回数组中在 `fromIndex`之后，子数组`elements` 出现的第一个位置，未找到返回 None。

### 契约

函数会对 `fromIndex` 范围进行检查，`fromIndex` 小于 0 时，将会从第 0 位开始搜索，当 `fromIndex` 大于等于本数组的大小时，结果为 None。

参数：

- elements: Array\<T> - 需要定位的元素。
- fromIndex: Int64 - 开始搜索的起始位置。

返回值：

- Option\<Int64> - 数组中在 `fromIndex`之后，子数组 `elements` 出现的第一个位置，未找到返回 None。

## func indexOf(T)

### 签名

```cangjie role=signature
public func indexOf(element: T): Option<Int64>
```

获取数组中 `element` 出现的第一个位置，如果数组中不包含此元素，返回 None。

### 契约

参数：

- element: T - 需要定位的元素。

返回值：

- Option\<Int64> - 数组中 `element` 出现的第一个位置，如果数组中不包含此元素，返回 None。

## func indexOf(T, Int64)

### 签名

```cangjie role=signature
public func indexOf(element: T, fromIndex: Int64): Option<Int64>
```

返回数组中在 `fromIndex`之后， `element` 出现的第一个位置，未找到返回 None。

### 契约

函数会从下标 `fromIndex` 开始查找，`fromIndex` 小于 0 时，将会从第 0 位开始搜索，当 `fromIndex` 大于等于本数组的大小时，结果为 None。

参数：

- element: T - 需要定位的元素。
- fromIndex: Int64 - 查找的起始位置。

返回值：

- Option\<Int64> - 返回数组中在 `fromIndex`之后， `element` 出现的第一个位置，未找到返回 None。
