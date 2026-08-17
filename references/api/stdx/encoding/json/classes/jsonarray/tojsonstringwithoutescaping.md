<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonarray.tojsonstringwithoutescaping" parent="stdx.encoding.json.class.jsonarray" -->
# JsonArray.toJsonStringWithoutEscaping

[← JsonArray](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public func toJsonStringWithoutEscaping(): String
```

将 JsonArray 转换为 JSON 格式的 (带有空格换行符) 的字符串，不对 html 特殊字符 `&` 转义。

## 返回值

- String - 转换后的 JSON 格式字符串。

## 重载 2

### 签名

```cangjie role=signature
public func toJsonStringWithoutEscaping(depth: Int64, bracketInNewLine!: Bool = false, indent!: String = "  "): String
```

将 JsonArray 转换为 JSON 格式的字符串。该函数将指定初始的缩进深度、第一个括号后是否换行以及缩进字符串，不对 html 特殊字符 `&` 转义。

## 参数

- depth: Int64 - 指定的缩进深度。
- bracketInNewLine!: Bool - 第一个括号是否换行，如果为 `true`，第一个括号将另起一行并且按照指定的深度缩进。
- indent!: String - 指定的缩进字符串，缩进字符串中只允许空格和制表符的组合，默认为两个空格。

## 返回值

- String - 转换后的 JSON 格式字符串。

## 异常

- IllegalArgumentException - 如果 depth 为负数，或 indent 中存在 ' ' 和 '\t' 以外的字符，则抛出异常。

