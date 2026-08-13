<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.getchars" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.getChars

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func getChars(): CPointer<UInt8>
```

获取该字符串的指针。

## 契约

返回值：

- CPointer\<UInt8> - 该字符串的指针。
