<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.enum.jsontoken.value-jsonbool" parent="stdx.encoding.json.stream.enum.jsontoken" -->
# JsonToken.JsonBool

[← JsonToken](index.md)

## 签名

```cangjie role=signature
JsonBool
```

表示 JSON 的 bool 类型。

## 契约

功能：表示 JSON 的 bool 类型。如果 JsonReader.peek() 返回的是该类型，可以使用 JsonReader.readValue\<Bool>() 读取。
