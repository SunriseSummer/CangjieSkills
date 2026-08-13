<!-- cj-doc kind="api-member" level="6" id="std.regex.class.regex.init" parent="std.regex.class.regex" -->
# Regex.init

[← Regex](index.md)

## 签名

```cangjie role=signature
public init(pattern: String, flags: Array<RegexFlag>)
```

创建 Regex 实例。

## 契约

参数：

- pattern: String - 正则表达式。
- flags: Array\<RegexFlag> - 正则匹配的模式列表。

异常：

- RegexException - 当初始化失败时，抛出异常。
