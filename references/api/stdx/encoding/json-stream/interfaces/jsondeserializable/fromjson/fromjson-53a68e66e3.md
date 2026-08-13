<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-53a68e66e3" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): BigInt
```

从 JsonReader 中读取一个 BigInt。

适用扩展：[extend BigInt <: JsonDeserializable<BigInt>](../extensions/extend-bigint-jsondeserializable-bigint.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- BigInt - BigInt 类型的实例。
