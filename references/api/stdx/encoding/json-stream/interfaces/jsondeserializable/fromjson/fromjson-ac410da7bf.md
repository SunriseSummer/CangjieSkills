<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-ac410da7bf" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): HashMap<String, T>
```

从 JsonReader 中读取一个 HashMap。

适用扩展：[extend<T> HashMap<String, T> <: JsonDeserializable<HashMap<String, T>> where T <: JsonDeserializable<T>](../extensions/extend-t-hashmap-string-t-jsondeserializable-hashmap-string-t-w-ead83c91.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- HashMap\<String, T> - HashMap\<String, T> 类型的实例。
