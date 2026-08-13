<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-c18015740f" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): Array<T>
```

从 JsonReader 中读取一个 Array。

适用扩展：[extend<T> Array<T> <: JsonDeserializable<Array<T>> where T <: JsonDeserializable<T>](../extensions/extend-t-array-t-jsondeserializable-array-t-where-t-jsondeserializable-t.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- Array\<T> - Array 类型的实例。
