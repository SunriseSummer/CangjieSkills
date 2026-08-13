<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-3ab735cd70" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): UInt16
```

从 JsonReader 中读取一个 UInt16。

适用扩展：[extend UInt16 <: JsonDeserializable<UInt16>](../extensions/extend-uint16-jsondeserializable-uint16.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- UInt16 - UInt16 类型的实例。

异常：

- OverflowException - 读取的数据超过范围时，抛出异常。
