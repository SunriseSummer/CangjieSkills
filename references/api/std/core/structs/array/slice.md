<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.slice" parent="std.core.struct.array" -->
# Array<T>.slice

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func slice(start: Int64, len: Int64): Array<T>
```

获取数组切片。

## 契约

> **注意：**
>
> 切片不会对数组数据进行拷贝，是对原数据特定区间的引用。

参数：

- start: Int64 - 切片的起始位置，取值需大于 0，且 start + len 小于等于当前 Array 实例的长度。
- len: Int64 - 切片的长度，取值需大于 0。

返回值：

- Array\<T> - 返回切片后的数组。

异常：

- IndexOutOfBoundsException - 如果参数不符合上述取值范围，抛出异常。
