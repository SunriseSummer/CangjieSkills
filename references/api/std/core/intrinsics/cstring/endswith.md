<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.endswith" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.endsWith

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func endsWith(suffix: CString): Bool
```

判断字符串是否包含指定后缀。

## 契约

参数：

- suffix: CString - 匹配的目标后缀字符串。

返回值：

- Bool - 如果该字符串包含 suffix 后缀，返回 true，如果该字符串不包含 suffix 后缀，返回 false，特别地，如果原字符串或者 suffix 后缀字符串指针为空，均返回 false。
