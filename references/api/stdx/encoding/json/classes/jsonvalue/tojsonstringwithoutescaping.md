<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonvalue.tojsonstringwithoutescaping" parent="stdx.encoding.json.class.jsonvalue" -->
# JsonValue.toJsonStringWithoutEscaping

[← JsonValue](index.md)

## 签名

```cangjie role=signature
public func toJsonStringWithoutEscaping(): String
```

将 JsonValue 转换为 JSON 格式的 (带有空格换行符) 字符串，不对 html 特殊字符 `&` 转义。

## 返回值

- String - 转换后的 JSON 格式字符串。

