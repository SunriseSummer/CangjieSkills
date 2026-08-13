<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.enum.jsontoken.value-jsonstring" parent="stdx.encoding.json.stream.enum.jsontoken" -->
# JsonToken.JsonString

[← JsonToken](index.md)

## 签名

```cangjie role=signature
JsonString
```

表示 JSON 的 string 类型。

## 契约

功能：表示 JSON 的 string 类型。如果 JsonReader.peek() 返回的是该类型，可以使用 JsonReader.readValue\<String>() 读取。
