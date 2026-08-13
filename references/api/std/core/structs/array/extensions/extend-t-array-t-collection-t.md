<!-- cj-doc kind="api-extension" level="6" id="std.core.struct.array.extension.extend-t-array-t-collection-t" parent="std.core.struct.array" -->
# extend<T> Array<T> <: Collection<T>

[← Array<T>](../index.md)

`extend<T> Array<T> <: Collection<T>`

为 Array<T> 类型实现 Collection 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`size: Int64`](../prop-size.md) | 获取元素数量。 |
| [`isEmpty(): Bool`](../isempty.md) | 判断数组是否为空。 |
| [`iterator(): Iterator<T>`](../iterator.md) | 获取当前数组的迭代器，用于遍历数组。 |
| [`toArray(): Array<T>`](../toarray.md) | 根据当前 Array 实例拷贝一个新的 Array 实例。 |
