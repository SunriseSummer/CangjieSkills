<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-22435eb2d8" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): String
```

从 JsonReader 中读取一个 String。

适用扩展：[extend String <: JsonDeserializable<String>](../extensions/extend-string-jsondeserializable-string.md)。

## 契约

根据下一个 `JsonToken` 的不同，`String` 的反序列化结果将会不同：

- 当下一个 `JsonToken` 是 `JsonString` 时， 反序列化过程会按照标准ECMA-404 The JSON Data Interchange Standard对读到的 `String` 进行转义。
- 当下一个 `JsonToken` 是 `JsonNumber` `JsonBool` `JsonNull` 其中一个时，将会读取下一个 `value` 字段的原始字符串并返回。
- 当下一个 `JsonToken` 是其它类型时，调用此接口会抛异常。

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- String - String 类型的实例。
