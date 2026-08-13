<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.tostring" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.toString

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将 CString 类型转为仓颉的 String 类型。

## 契约

返回值：

- String - 转换后的字符串。

异常：

- IllegalArgumentException - 不合法的 UTF-8 字节序列。
