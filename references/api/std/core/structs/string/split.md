<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.split" parent="std.core.struct.string" -->
# String.split

[← String](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func split(String, Bool)

### 签名

```cangjie role=signature
public func split(str: String, removeEmpty!: Bool = false): Array<String>
```

对原字符串按照字符串 str 分隔符分割，指定是否删除空串。

### 契约

当 str 未出现在原字符串中，返回长度为 1 的字符串数组，唯一的元素为原字符串。

参数：

- str: String - 字符串分隔符。
- removeEmpty!: Bool - 移除分割结果中的空字符串，默认值为 false。

返回值：

- Array\<String> - 分割后的字符串数组。

## func split(String, Int64, Bool)

### 签名

```cangjie role=signature
public func split(str: String, maxSplits: Int64, removeEmpty!: Bool = false): Array<String>
```

对原字符串按照字符串 str 分隔符分割，指定最多分隔子串数，以及是否删除空串。

### 契约

- 当 maxSplit 为 0 时，返回空的字符串数组；
- 当 maxSplit 为 1 时，返回长度为 1 的字符串数组，唯一的元素为原字符串；
- 当 maxSplit 为负数时，返回完整分割后的字符串数组；
- 当 maxSplit 大于完整分割出来的子字符串数量时，返回完整分割的字符串数组；
- 当 str 未出现在原字符串中，返回长度为 1 的字符串数组，唯一的元素为原字符串；
- 当 str 为空时，对每个字符进行分割；当原字符串和分隔符都为空时，返回空字符串数组。

参数：

- str: String - 字符串分隔符。
- maxSplits: Int64 - 最多分割为 maxSplit 个子字符串。
- removeEmpty!: Bool - 移除分割结果中的空字符串，默认值为 false。

返回值：

- Array\<String> - 分割后的字符串数组。
