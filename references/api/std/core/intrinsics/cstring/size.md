<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.size" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.size

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func size(): Int64
```

返回该字符串长度，同 C 语言中的 `strlen`。

## 契约

返回值：

- Int64 - 字符串长度。
