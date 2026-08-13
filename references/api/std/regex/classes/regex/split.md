<!-- cj-doc kind="api-member" level="6" id="std.regex.class.regex.split" parent="std.regex.class.regex" -->
# Regex.split

[← Regex](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func split(String)

### 签名

```cangjie role=signature
public func split(input: String): Array<String>
```

将给定的输入序列根据正则尽可能的分割成多个子序列。

### 契约

参数：

- input: String - 待匹配序列。

返回值：

- Array\<String> - 子序列数组。

## func split(String, Int64)

### 签名

```cangjie role=signature
public func split(input: String, limit: Int64): Array<String>
```

将给定的输入序列根据正则尽可能的分割成多个子序列 （最多分割成 limit 个子串）。

### 契约

参数：

- input: String - 待匹配序列。
- limit: Int64 - 最多分割的子串个数。

返回值：

- Array\<String> - 如果 limit>0，返回最多 limit 个子串；如果 limit<=0，返回最大可分割数个子串。
