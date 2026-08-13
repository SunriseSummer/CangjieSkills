<!-- cj-doc kind="api-type" level="5" id="std.core.struct.cpointerhandle" parent="std.core" -->
# CPointerHandle<T> where T <: CType

[← std.core](../../index.md)

`CPointerHandle<T> where T <: CType`

表示 Array 数组的原始指针，该类型中的泛型参数应该满足 CType 约束。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`array: Array<T>`](field-array.md) | 原始指针对应的 Array 数组实例。 |
| [`pointer: CPointer<T>`](field-pointer.md) | 获取指定 Array 数组对应的原始指针。 |
