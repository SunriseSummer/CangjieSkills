<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.indexof" parent="std.core.struct.string" -->
# String.indexOf

[← String](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func indexOf(Byte)

### 签名

```cangjie role=signature
public func indexOf(b: Byte): Option<Int64>
```

获取指定字节 b 第一次出现的在原字符串内的索引。

### 契约

参数：

- b: Byte - 待搜索的字节。

返回值：

- Option\<Int64> - 如果原字符串中包含指定字节，返回其第一次出现的索引，如果原字符串中没有此字节，返回 Option\<Int64>.None。

## func indexOf(Byte, Int64)

### 签名

```cangjie role=signature
public func indexOf(b: Byte, fromIndex: Int64): Option<Int64>
```

从原字符串指定索引开始搜索，获取指定字节第一次出现的在原字符串内的索引。

### 契约

参数：

- b: Byte - 待搜索的字节。
- fromIndex: Int64 - 以指定的索引 fromIndex 开始搜索。

返回值：

- Option\<Int64> - 如果搜索成功，返回指定字节第一次出现的索引，否则返回 `None`。特别地，当 fromIndex 小于零，效果同 0，当 fromIndex 大于等于原字符串长度，返回 Option\<Int64>.None。

## func indexOf(String)

### 签名

```cangjie role=signature
public func indexOf(str: String): Option<Int64>
```

返回指定字符串 str 在原字符串中第一次出现的起始索引。

### 契约

参数：

- str: String - 待搜索的字符串。

返回值：

- Option\<Int64> - 如果原字符串包含 str 字符串，返回其第一次出现的索引，如果原字符串中没有 str 字符串，返回 None。

## func indexOf(String, Int64)

### 签名

```cangjie role=signature
public func indexOf(str: String, fromIndex: Int64): Option<Int64>
```

从原字符串 fromIndex 索引开始搜索，获取指定字符串 str 第一次出现的在原字符串的起始索引。

### 契约

参数：

- str: String - 待搜索的字符串。
- fromIndex: Int64 - 以指定的索引 fromIndex 开始搜索。

返回值：

- Option\<Int64> - 如果搜索成功，返回 str 第一次出现的索引，否则返回 None。特别地，当 str 是空字符串时，如果 fromIndex 大于 0，返回 None，否则返回 Some(0)。当 fromIndex 小于零，效果同 0，当 fromIndex 大于等于原字符串长度返回 None。
