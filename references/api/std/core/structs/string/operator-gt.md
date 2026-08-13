<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.operator-gt" parent="std.core.struct.string" -->
# String.>

[← String](index.md)

## 签名

```cangjie role=signature
public operator const func >(right: String): Bool
```

判断两个字符串大小。

## 契约

参数：

- right: String - 待比较的字符串。

返回值：

- Bool - 原字符串字典序大于 right 时，返回 true，否则返回 false。
