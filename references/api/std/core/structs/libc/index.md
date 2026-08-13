<!-- cj-doc kind="api-type" level="5" id="std.core.struct.libc" parent="std.core" -->
# LibC

[← std.core](../../index.md)

`LibC`

提供了仓颉中较为高频使用的 C 接口，如申请、释放堆上 CType 实例。

## 方法

| 签名 | 功能 |
|---|---|
| [`unsafe static free(cstr: CString): Unit`](free.md) | 释放 C 风格字符串。 |
| [`unsafe static free<T>(p: CPointer<T>): Unit where T <: CType`](free.md) | 释放指针 p 指向的堆内存。 |
| [`static malloc<T>(count!: Int64 = 1): CPointer<T> where T <: CType`](malloc.md) | 在堆中申请指定个数的 `T` 实例，并返回其起始指针。 |
| [`unsafe static mallocCString(str: String): CString`](malloccstring.md) | 通过 String 申请与之字符内容相同的 C 风格字符串。 |
