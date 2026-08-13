<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonobject.tojsonstring" parent="stdx.encoding.json.class.jsonobject" -->
# JsonObject.toJsonString

[← JsonObject](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func toJsonString()

### 签名

```cangjie role=signature
public func toJsonString(): String
```

将 JsonObject 转换为 JSON 格式的 (带有空格换行符) 字符串。

### 契约

返回值：

- String - 转换后的 JSON 格式字符串。

## func toJsonString(Int64, Bool, String)

### 签名

```cangjie role=signature
public func toJsonString(depth: Int64, bracketInNewLine!: Bool = false, indent!: String = "  "): String
```

将 JsonObject 转换为 Json 格式的字符串。

### 契约

功能：将 JsonObject 转换为 Json 格式的字符串。该函数将指定初始的缩进深度、第一个括号后是否换行以及缩进字符串。

参数：

- depth: Int64 - 缩进深度。
- bracketInNewLine!: Bool - 第一个括号是否换行，如果为 `true`，第一个括号将另起一行并且按照指定的深度缩进。
- indent!: String - 指定的缩进字符串，缩进字符串中只允许空格和制表符的组合，默认为两个空格。

返回值：

- String - 转换后的 JSON 格式字符串。

异常：

- IllegalArgumentException - 如果 depth 为负数，或 indent 中存在 ' ' 和 '\t' 以外的字符，则抛出异常。
