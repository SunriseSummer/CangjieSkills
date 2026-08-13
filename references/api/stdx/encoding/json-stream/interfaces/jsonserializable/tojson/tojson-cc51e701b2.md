<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsonserializable.tojson.tojson-cc51e701b2" parent="stdx.encoding.json.stream.interface.jsonserializable.tojson" -->
# JsonSerializable.func toJson(JsonWriter)

[← JsonSerializable.toJson](index.md)

## 签名

```cangjie role=signature
public func toJson(w: JsonWriter): Unit
```

将 Float64 类型写入参数 `w` 指定的 JsonWriter 实例中。

适用扩展：[extend Float64 <: JsonSerializable](../extensions/extend-float64-jsonserializable.md)。

## 契约

参数：

- w: JsonWriter - 写入序列化结果的 JsonWriter 实例。
