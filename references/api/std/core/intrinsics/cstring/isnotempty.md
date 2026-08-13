<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.isnotempty" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.isNotEmpty

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func isNotEmpty(): Bool
```

判断字符串是否不为空字符串。

## 契约

返回值：

- Bool - 如果不为空字符串，返回 true，如果字符串指针为空，返回 false。
