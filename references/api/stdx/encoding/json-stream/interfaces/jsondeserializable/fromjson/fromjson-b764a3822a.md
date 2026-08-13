<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-b764a3822a" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): Bool
```

从 JsonReader 中读取一个 Bool。

适用扩展：[extend Bool <: JsonDeserializable<Bool>](../extensions/extend-bool-jsondeserializable-bool.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- Bool - Bool 类型的实例。
