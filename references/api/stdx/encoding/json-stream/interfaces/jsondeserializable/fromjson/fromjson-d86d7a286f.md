<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-d86d7a286f" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): Int8
```

从 JsonReader 中读取一个 Int8。

适用扩展：[extend Int8 <: JsonDeserializable<Int8>](../extensions/extend-int8-jsondeserializable-int8.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- Int8 - Int8 类型的实例。

异常：

- OverflowException - 读取的数据超过范围时，抛出异常。
