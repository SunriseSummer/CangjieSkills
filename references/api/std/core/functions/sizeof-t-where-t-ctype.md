<!-- cj-doc kind="api-member" level="5" id="std.core.func.sizeof-t-where-t-ctype" parent="std.core" -->
# sizeOf<T>() where T <: CType

[← std.core](../index.md)

## 签名

```cangjie role=signature
public func sizeOf<T>(): UIntNative where T <: CType
```

获取类型 T 所占用的内存空间大小。

## 契约

返回值：

- UIntNative - 类型 T 所占用内存空间的字节数。
