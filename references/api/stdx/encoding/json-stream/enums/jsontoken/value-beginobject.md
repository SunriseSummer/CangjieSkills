<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.enum.jsontoken.value-beginobject" parent="stdx.encoding.json.stream.enum.jsontoken" -->
# JsonToken.BeginObject

[← JsonToken](index.md)

## 签名

```cangjie role=signature
BeginObject
```

表示 JSON 中 object 的开始。

## 契约

功能：表示 JSON 中 object 的开始。如果 JsonReader.peek() 返回的是该类型，可以使用 JsonReader.startObject() 读取。
