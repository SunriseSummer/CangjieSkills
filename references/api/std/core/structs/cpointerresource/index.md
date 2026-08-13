<!-- cj-doc kind="api-type" level="5" id="std.core.struct.cpointerresource" parent="std.core" -->
# CPointerResource<T> where T <: CType

[← std.core](../../index.md)

`CPointerResource<T> <: Resource where T <: CType`

该结构体表示 CPointer 对应的资源管理类型，其实例可以通过 CPointer 的成员函数 `asResource` 获取。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`value: CPointer<T>`](field-value.md) | 表示当前实例管理的 CPointer<T> 类型实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 释放其管理的 CPointer<T> 实例指向的内容。 |
| [`isClosed(): Bool`](isclosed.md) | 判断该指针内容是否已被释放。 |
