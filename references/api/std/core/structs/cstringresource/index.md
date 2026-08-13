<!-- cj-doc kind="api-type" level="5" id="std.core.struct.cstringresource" parent="std.core" -->
# CStringResource

[← std.core](../../index.md)

`CStringResource <: Resource`

该结构体表示 CString 对应的资源管理类型，其实例可以通过 CString 的成员函数 `asResource` 获取。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`value: CString`](field-value.md) | 表示当前实例管理的 CString 资源。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 释放当前实例管理的 CString 类型实例指向的内容。 |
| [`isClosed(): Bool`](isclosed.md) | 判断该字符串是否被释放。 |
