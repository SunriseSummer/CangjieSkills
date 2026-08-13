<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-629b77c800" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): Option<T>
```

从 JsonReader 中读取一个 Option。

适用扩展：[extend<T> Option <T> <: JsonDeserializable<Option<T>> where T <: JsonDeserializable<T>](../extensions/extend-t-option-t-jsondeserializable-option-t-where-t-jsondeser-e7c1069a.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- Option\<T> - Option 类型的实例。
