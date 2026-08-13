<!-- cj-doc kind="api-member" level="7" id="std.core.enum.option.tostring" parent="std.core.enum.option.extension.extend-t-option-t-tostring-where-t-tostring" -->
# Option<T>.toString

[← extend<T> Option<T> <: ToString where T <: ToString](extensions/extend-t-option-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将 Option 转换为可输出的字符串，字符串内容为 "Some(${T.toString()})" 或 "None"。

## 契约

返回值：

- String - 转化后的字符串。
