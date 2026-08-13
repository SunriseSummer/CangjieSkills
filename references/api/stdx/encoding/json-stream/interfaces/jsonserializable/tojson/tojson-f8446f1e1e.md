<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsonserializable.tojson.tojson-f8446f1e1e" parent="stdx.encoding.json.stream.interface.jsonserializable.tojson" -->
# JsonSerializable.func toJson(JsonWriter)

[← JsonSerializable.toJson](index.md)

## 签名

```cangjie role=signature
public func toJson(w: JsonWriter): Unit
```

将 Int16 类型写入参数 `w` 指定的 JsonWriter 实例中。

适用扩展：[extend Int16 <: JsonSerializable](../extensions/extend-int16-jsonserializable.md)。

## 契约

参数：

- w: JsonWriter - 写入序列化结果的 JsonWriter 实例。
