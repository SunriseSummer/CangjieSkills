<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-b537d879b8" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): ArrayList<T>
```

从 JsonReader 中读取一个 ArrayList。

适用扩展：[extend<T> ArrayList<T> <: JsonDeserializable<ArrayList<T>> where T <: JsonDeserializable<T>](../extensions/extend-t-arraylist-t-jsondeserializable-arraylist-t-where-t-jso-9a74c610.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- ArrayList \<T> - ArrayList 类型的实例。
