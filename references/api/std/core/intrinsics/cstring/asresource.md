<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.asresource" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.asResource

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func asResource(): CStringResource
```

获取当前 CString 实例对应的 CStringResource C 字符串资源类型实例。

## 契约

CStringResource 实现了 Resource 接口，可以在 `try-with-resource` 语法上下文中实现资源自动释放。

返回值：

- CStringResource - 对应的 CStringResource C 字符串资源类型实例。
