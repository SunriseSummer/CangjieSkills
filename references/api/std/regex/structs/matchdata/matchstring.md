<!-- cj-doc kind="api-member" level="6" id="std.regex.struct.matchdata.matchstring" parent="std.regex.struct.matchdata" -->
# MatchData.matchString

[← MatchData](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func matchString()

### 签名

```cangjie role=signature
public func matchString(): String
```

获取上一次匹配到的子字符串，结果与调用 matchString(0) 相同。

### 契约

返回值：

- String - 匹配到的子字符串。

## func matchString(Int64)

### 签名

```cangjie role=signature
public func matchString(group: Int64): String
```

根据给定的索引获取上一次匹配中该捕获组匹配到的子字符串。

### 契约

捕获组的索引从 1 开始，索引为 0 表示获取整个正则表达式的匹配结果。

参数：

- group: Int64 - 指定组。

返回值：

- String - 匹配到的子字符串。

异常：

- IllegalArgumentException - 当未开启捕获组提取，或 group 小于 0 或者大于 groupCount 时，抛出异常。

## func matchString(String)

### 签名

```cangjie role=signature
public func matchString(group: String): String
```

根据给定的命名捕获组名称获取上一次匹配中该捕获组匹配到的子字符串。

### 契约

参数：

- group: String - 指定命名捕获组的名称。

返回值：

- String - 匹配到的子字符串。

异常：

- IllegalArgumentException - 当未开启捕获组提取，或捕获组名称不存在，抛出异常。
