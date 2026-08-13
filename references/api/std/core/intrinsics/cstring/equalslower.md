<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.equalslower" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.equalsLower

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func equalsLower(rhs: CString): Bool
```

判断两个字符串是否相等，忽略大小写。

## 契约

参数：

- rhs: CString - 匹配的目标字符串。

返回值：

- Bool - 如果两个字符串忽略大小写相等，返回 true，否则返回 false。
