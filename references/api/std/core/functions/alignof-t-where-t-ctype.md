<!-- cj-doc kind="api-member" level="5" id="std.core.func.alignof-t-where-t-ctype" parent="std.core" -->
# alignOf<T>() where T <: CType

[← std.core](../index.md)

## 签名

```cangjie role=signature
public func alignOf<T>(): UIntNative where T <: CType
```

获取类型 T 的内存对齐值。

## 契约

返回值：

- UIntNative - 类型 T 满足内存对齐要求的字节数。
