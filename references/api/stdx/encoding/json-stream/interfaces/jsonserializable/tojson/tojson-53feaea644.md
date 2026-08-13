<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsonserializable.tojson.tojson-53feaea644" parent="stdx.encoding.json.stream.interface.jsonserializable.tojson" -->
# JsonSerializable.func toJson(JsonWriter)

[← JsonSerializable.toJson](index.md)

## 签名

```cangjie role=signature
func toJson(w: JsonWriter): Unit
```

将实现了 JsonSerializable 接口的类型写入参数 `w` 指定的 JsonWriter 实例中。

## 契约

参数：

- w: JsonWriter - 写入序列化结果的 JsonWriter 实例。
