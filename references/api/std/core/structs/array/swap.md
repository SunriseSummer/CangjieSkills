<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.swap" parent="std.core.struct.array" -->
# Array<T>.swap

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func swap(index1: Int64, index2: Int64): Unit
```

交换指定位置的两个元素。

## 契约

如果 index1 和 index2 指向同一个位置，将不做交换。

参数：

- index1: Int64 - 需要交换的两个元素的下标之一，取值范围为 [0, this.size)。
- index2: Int64 - 需要交换的两个元素的下标之一，取值范围为 [0, this.size)。

异常：

- IllegalArgumentException - index1 / index2 小于 0 或大于等于 this.size。
