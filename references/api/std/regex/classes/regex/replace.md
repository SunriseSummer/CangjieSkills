<!-- cj-doc kind="api-member" level="6" id="std.regex.class.regex.replace" parent="std.regex.class.regex" -->
# Regex.replace

[← Regex](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func replace(String, String)

### 签名

```cangjie role=signature
public func replace(input: String, replacement: String): String
```

自当前字符串起始位置开始，匹配到的第一个子序列替换为目标字符串。

### 契约

参数：

- input: String - 待匹配序列。
- replacement: String - 指定替换字符串。

返回值：

- String - 替换后字符串。

## func replace(String, String, Int64)

### 签名

```cangjie role=signature
public func replace(input: String, replacement: String, index: Int64): String
```

从输入序列的 index 位置起匹配正则，将匹配到的第一个子序列替换为目标字符串。

### 契约

参数：

- input: String - 待匹配序列。
- replacement: String - 指定替换字符串。
- index: Int64 - 匹配开始位置。

返回值：

- String - 替换后字符串。

异常：

- IndexOutOfBoundsException - 当 index 小于 0，或 index 大于等于输入序列的 size 时，抛出异常。
