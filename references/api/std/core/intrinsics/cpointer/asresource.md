<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cpointer.asresource" parent="std.core.intrinsic.cpointer.extension.extend-t-cpointer-t" -->
# CPointer<T>.asResource

[← extend<T> CPointer<T>](extensions/extend-t-cpointer-t.md)

## 签名

```cangjie role=signature
public func asResource(): CPointerResource<T>
```

获取该指针 CPointerResource 实例，该实例可以在 `try-with-resource` 语法上下文中实现内容自动释放。

## 契约

返回值：

- CPointerResource\<T> - 当前指针对应的 CPointerResource 实例。
