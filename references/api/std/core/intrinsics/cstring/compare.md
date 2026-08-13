<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.compare" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.compare

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

## 签名

```cangjie role=signature
public func compare(str: CString): Int32
```

按字典序比较两个字符串，同 C 语言中的 `strcmp`。

## 契约

参数：

- str: CString - 比较的目标字符串。

返回值：

- Int32 - 两者相等返回 0，如果当前字符串比参数 str 小，返回 -1，否则返回 1。

异常：

- IllegalMemoryException - 如果被比较的两个 CString 中存在空指针，抛出异常。
