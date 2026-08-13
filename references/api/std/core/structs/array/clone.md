<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.clone" parent="std.core.struct.array" -->
# Array<T>.clone

[← Array<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func clone()

### 签名

```cangjie role=signature
public func clone(): Array<T>
```

克隆数组，将对数组数据进行深拷贝。

### 契约

返回值：

- Array\<T> - 克隆得到的新数组。

## func clone(Range<Int64>)

### 签名

```cangjie role=signature
public func clone(range: Range<Int64>) : Array<T>
```

克隆数组的指定区间。

### 契约

> **注意：**
>
> 1. 如果参数 range 是使用 Range 构造函数构造的 Range 实例，有如下行为：
>    - start 的值就是构造函数传入的值本身，不受构造时传入的 hasStart 的值的影响。
>    - hasEnd 为 false 时，end 值不生效，且不受构造时传入的 isClosed 的值的影响，数组切片取到原数组最后一个元素。
> 2. range 的步长只能为 1。

参数：

- range: Range\<Int64> - 克隆的区间。

返回值：

- Array\<T> - 克隆得到的新数组。

异常：

- IndexOutOfBoundsException - range 超出数组范围时，抛出异常。
