<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.enum.jsontoken.value-endarray" parent="stdx.encoding.json.stream.enum.jsontoken" -->
# JsonToken.EndArray

[← JsonToken](index.md)

## 签名

```cangjie role=signature
EndArray
```

表示 JSON 中 array 的结束。

## 契约

功能：表示 JSON 中 array 的结束。如果 JsonReader.peek() 返回的是该类型，可以使用 JsonReader.endArray() 读取。
