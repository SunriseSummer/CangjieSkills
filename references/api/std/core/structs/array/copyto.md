<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.copyto" parent="std.core.struct.array" -->
# Array<T>.copyTo

[← Array<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func copyTo(Array<T>)

### 签名

```cangjie role=signature
public func copyTo(dst: Array<T>): Unit
```

将当前数组的全部元素拷贝到目标数组 dst 中。

### 契约

拷贝长度为当前数组的长度，从目标数组的起始位置开始写入，要求当前数组的长度不大于目标数组的长度。

参数：

- dst: Array\<T> - 目标数组。

异常：

- IllegalArgumentException - 当前数组的长度大于目标数组的长度。

## func copyTo(Array<T>, Int64, Int64, Int64)

### 签名

```cangjie role=signature
public func copyTo(dst: Array<T>, srcStart: Int64, dstStart: Int64, copyLen: Int64): Unit
```

将当前数组中的一段数据拷贝到目标数组中。

### 契约

参数：

- dst: Array\<T> - 目标数组。
- srcStart: Int64 - 从 this 数组的 srcStart 下标开始拷贝，取值范围为 [0, this.size)。
- dstStart: Int64 - 从目标数组的 dstStart 下标开始写入，取值范围为 [0, dst.size)。
- copyLen: Int64 - 拷贝数组的长度，取值要求为 copyLen + srcStart < this.size，copyLen + dstStart < dst.size。

异常：

- IllegalArgumentException - copyLen 小于 0 则抛出此异常。
- IndexOutOfBoundsException - 如果参数不满足上述取值范围，抛出此异常。
