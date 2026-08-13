<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.lastindexof" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.lastIndexOf

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func lastIndexOf(Array<T>)

### 签名

```cangjie role=signature
public func lastIndexOf(elements: Array<T>): Option<Int64>
```

返回数组中子数组 `elements` 出现的最后一个位置，如果数组中不存在此子数组，返回 None。

### 契约

参数：

- elements: Array\<T> - 需要定位的目标数组。

返回值：

- Option\<Int64> - 数组中 `elements` 出现的最后一个位置，如果数组中不存在此子数组，返回 None。

## func lastIndexOf(Array<T>, Int64)

### 签名

```cangjie role=signature
public func lastIndexOf(elements: Array<T>, fromIndex: Int64): Option<Int64>
```

从 `fromIndex` 开始向后搜索，返回数组中子数组 `elements` 出现的最后一个位置，如果数组中不存在此子数组，返回 None。

### 契约

函数会对 `fromIndex` 范围进行检查，`fromIndex` 小于 0 时，将会从第 0 位开始搜索，当 `fromIndex` 大于等于本数组的大小时，结果为 None。

参数：

- elements: Array\<T> - 需要定位的目标数组。
- fromIndex: Int64 - 搜索开始的位置。

返回值：

- Option\<Int64> - 从 `fromIndex` 开始向后搜索，数组中子数组 `elements` 出现的最后一个位置，如果数组中不存在此子数组，返回 None。

## func lastIndexOf(T)

### 签名

```cangjie role=signature
public func lastIndexOf(element: T): Option<Int64>
```

返回数组中 `element` 出现的最后一个位置，如果数组中不存在此元素，返回 None。

### 契约

参数：

- element: T - 需要定位的目标元素。

返回值：

- Option\<Int64> - 数组中 `element` 出现的最后一个位置，如果数组中不存在此元素，返回 None。

## func lastIndexOf(T, Int64)

### 签名

```cangjie role=signature
public func lastIndexOf(element: T, fromIndex: Int64): Option<Int64>
```

从 `fromIndex` 开始向后搜索，返回数组中 `element` 出现的最后一个位置，如果数组中不存在此元素，返回 None。

### 契约

函数会对 `fromIndex` 范围进行检查，`fromIndex` 小于 0 时，将会从第 0 位开始搜索，当 `fromIndex` 大于等于本数组的大小时，结果为 None。

参数：

- element: T - 需要定位的目标元素。
- fromIndex: Int64 - 搜索开始的位置。

返回值：

- Option\<Int64> - 从 `fromIndex` 开始向后搜索，返回数组中 `element` 出现的最后一个位置，如果数组中不存在此元素，返回 None。
