<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsonserializable.tojson.tojson-dd438c35c6" parent="stdx.encoding.json.stream.interface.jsonserializable.tojson" -->
# JsonSerializable.func toJson(JsonWriter)

[← JsonSerializable.toJson](index.md)

## 签名

```cangjie role=signature
public func toJson(w: JsonWriter): Unit
```

提供 DateTime 类型序列化到流的功能。

适用扩展：[extend DateTime <: JsonSerializable](../extensions/extend-datetime-jsonserializable.md)。

## 契约

该接口的功能与 JsonWriter 的 writeConfig中的属性 dateTimeFormat有关联，将会把 DateTime 按照dateTimeFormat中的格式输出到目标流中，可以通过修改dateTimeFormat实现不同的格式控制。

参数：

- w: JsonWriter - 写入序列化结果的 JsonWriter 实例。
