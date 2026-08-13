<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.operator-indexer" parent="std.core.struct.array" -->
# Array<T>.[]

[← Array<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## operator func \[](Int64)

### 签名

```cangjie role=signature
public operator func [](index: Int64): T
```

获取数组下标 index 对应的值。

### 契约

该函数中如果 index 越界，将抛出异常。

也可以通过 get 函数获取数组指定下标的元素，get 函数将在 index 越界时返回 None。

参数：

- index: Int64 - 要获取的值的下标，取值范围为 0, [Int64.Max]。

返回值：

- T - 数组中下标 index 对应的值。

异常：

- IndexOutOfBoundsException - 如果 index 小于 0，或大于等于数组长度，抛出异常。

## operator func \[](Int64, T)

### 签名

```cangjie role=signature
public operator func [](index: Int64, value!: T): Unit
```

修改数组中下标 index 对应的值。

### 契约

参数：

- index: Int64 - 需要修改值的下标，取值范围为 0, [Int64.Max]。
- value!: T - 修改的目标值。

异常：

- IndexOutOfBoundsException - 如果 index 小于 0，或大于等于数组长度，抛出异常。

## operator func \[](Range<Int64>)

### 签名

```cangjie role=signature
public operator func [](range: Range<Int64>): Array<T>
```

根据给定区间获取数组切片。

### 契约

> **注意：**
>
> 1. 如果参数 range 是使用 Range 构造函数构造的 Range 实例，有如下行为：
>    - start 的值就是构造函数传入的值本身，不受构造时传入的 hasStart 的值的影响。
>    - hasEnd 为 false 时，end 值不生效，且不受构造时传入的 isClosed 的值的影响，该数组切片取到原数组最后一个元素。
> 2. range 的步长只能为 1。

参数：

- range: Range\<Int64> - 切片的范围，range 表示的范围不能超过数组范围。

返回值：

- Array\<T> - 数组切片。

异常：

- IllegalArgumentException - 如果 range 的步长不等于 1，抛出异常。
- IndexOutOfBoundsException - 如果 range 表示的数组范围无效，抛出异常。

## operator func \[](Range<Int64>, Array<T>)

### 签名

```cangjie role=signature
public operator func [](range: Range<Int64>, value!: Array<T>): Unit
```

用指定的数组对本数组一个连续范围的元素赋值。

### 契约

range 表示的区见的长度和目标数组 value 的大小需相等。

> **注意：**
>
> 1. 如果参数 range 是使用 Range 构造函数构造的 Range 实例，有如下行为：
>    - start 的值就是构造函数传入的值本身，不受构造时传入的 hasStart 的值的影响。
>    - hasEnd 为 false 时，end 值不生效，且不受构造时传入的 isClosed 的值的影响，该数组切片取到原数组最后一个元素。
> 2. range 的步长只能为 1。

参数：

- range: Range\<Int64> - 需要修改的数组范围，range 表示的范围不能超过数组范围。
- value!: Array\<T> - 修改的目标值。

异常：

- IllegalArgumentException - 如果 range 的步长不等于 1，或 range 长度不等于 value 长度，抛出异常。
- IndexOutOfBoundsException - 如果 range 表示的数组范围无效，抛出异常。
