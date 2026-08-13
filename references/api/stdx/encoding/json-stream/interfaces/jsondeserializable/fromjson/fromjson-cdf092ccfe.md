<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-cdf092ccfe" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): Int64
```

从 JsonReader 中读取一个 Int64。

适用扩展：[extend Int64 <: JsonDeserializable<Int64>](../extensions/extend-int64-jsondeserializable-int64.md)。

## 契约

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- Int64 - Int64 类型的实例。

异常：

- OverflowException - 读取的数据超过范围时，抛出异常。
