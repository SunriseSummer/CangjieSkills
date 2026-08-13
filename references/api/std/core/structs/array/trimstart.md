<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.trimstart" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.trimStart

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func trimStart((T)->Bool)

### 签名

```cangjie role=signature
public func trimStart(predicate: (T)->Bool): Array<T>
```

修剪当前数组，从头开始删除符合过滤条件的函数，直到第一个不符合的元素为止，并返回当前数组的切片。

### 契约

参数：

- predicate: (T)->Bool - 过滤条件。

返回值：

- Array\<T> - 修剪后的数组切片。

## func trimStart(Array<T>)

### 签名

```cangjie role=signature
public func trimStart(set: Array<T>): Array<T>
```

修剪当前数组，从头开始删除在指定集合 set 中的元素，直到第一个不在 set 中的元素为止，并返回当前数组的切片。

### 契约

参数：

- set: Array\<T> - 待删除的元素的集合。

返回值：

- Array\<T> - 修剪后的数组切片。
