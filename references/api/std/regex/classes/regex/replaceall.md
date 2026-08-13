<!-- cj-doc kind="api-member" level="6" id="std.regex.class.regex.replaceall" parent="std.regex.class.regex" -->
# Regex.replaceAll

[← Regex](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func replaceAll(String, String)

### 签名

```cangjie role=signature
public func replaceAll(input: String, replacement: String): String
```

将输入序列中所有与正则匹配的子序列替换为给定的目标字符串。

### 契约

参数：

- input: String - 待匹配序列。
- replacement: String - 指定替换字符串。

返回值：

- String - 替换后的字符串。

## func replaceAll(String, String, Int64)

### 签名

```cangjie role=signature
public func replaceAll(input: String, replacement: String, limit: Int64): String
```

将输入序列中与正则匹配的前 limit 个子序列替换为给定的替换字符串。

### 契约

参数：

- input: String - 待匹配序列。
- replacement: String - 指定替换字符串。
- limit: Int64 - 替换次数。如果 limit 等于 0，返回原来的序列；如果 limit 为负数，将尽可能多次的替换。

返回值：

- String - 替换后字符串。
