<!-- cj-doc kind="api-member" level="6" id="std.regex.struct.matchdata.matchposition" parent="std.regex.struct.matchdata" -->
# MatchData.matchPosition

[← MatchData](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func matchPosition()

### 签名

```cangjie role=signature
public func matchPosition(): Position
```

获取上一次匹配到的子字符串在输入字符串中起始位置和末尾位置的索引。

### 契约

返回值：

- Position - 匹配结果位置信息。

## func matchPosition(Int64)

### 签名

```cangjie role=signature
public func matchPosition(group: Int64): Position
```

根据给定的索引获取上一次匹配中该捕获组匹配到的子字符串在输入字符串中的位置信息。

### 契约

参数：

- group: Int64 - 指定组。

返回值：

- Position - 对应捕获组的位置信息。

异常：

- IllegalArgumentException - 当未开启捕获组提取，或 group 小于 0 或者大于 groupCount 时，抛出异常。

## func matchPosition(String)

### 签名

```cangjie role=signature
public func matchPosition(group: String): Position
```

根据给定的命名捕获组名称取上一次匹配中该捕获组匹配到的子字符串在输入字符串中的位置信息。

### 契约

参数：

- group: String - 指定命名捕获组的名称。

返回值：

- Position - 对应捕获组的位置信息。

异常：

- IllegalArgumentException - 当未开启捕获组提取，或 捕获组名称不存在，抛出异常。
