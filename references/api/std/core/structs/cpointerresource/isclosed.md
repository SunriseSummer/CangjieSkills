<!-- cj-doc kind="api-member" level="6" id="std.core.struct.cpointerresource.isclosed" parent="std.core.struct.cpointerresource" -->
# CPointerResource<T> where T <: CType.isClosed

[← CPointerResource<T> where T <: CType](index.md)

## 签名

```cangjie role=signature
public func isClosed(): Bool
```

判断该指针内容是否已被释放。

## 契约

返回值：

- Bool - 返回 true 为已释放。
