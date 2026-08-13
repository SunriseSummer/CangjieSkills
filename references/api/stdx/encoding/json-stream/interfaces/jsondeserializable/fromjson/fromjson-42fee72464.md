<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-42fee72464" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): Decimal
```

从 JsonReader 中读取一个 Decimal。

适用扩展：[extend Decimal <: JsonDeserializable<Decimal>](../extensions/extend-decimal-jsondeserializable-decimal.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- Decimal - Decimal 类型的实例。
