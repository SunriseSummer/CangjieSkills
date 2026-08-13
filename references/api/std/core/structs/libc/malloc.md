<!-- cj-doc kind="api-member" level="6" id="std.core.struct.libc.malloc" parent="std.core.struct.libc" -->
# LibC.malloc

[← LibC](index.md)

## 签名

```cangjie role=signature
public static func malloc<T>(count!: Int64 = 1): CPointer<T> where T <: CType
```

在堆中申请指定个数的 `T` 实例，并返回其起始指针。

## 契约

申请内存长度为 sizeOf\<T>() * count。

参数：

- count!: Int64 - 为可选参数，默认为 1，表示申请 T 类型的个数。

返回值：

- CPointer\<T> - 申请的 T 类型指针。

异常：

- IllegalArgumentException - 入参为负数时，抛出异常。
