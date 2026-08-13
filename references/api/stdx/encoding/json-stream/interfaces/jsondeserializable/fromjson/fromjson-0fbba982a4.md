<!-- cj-doc kind="api-member" level="7" id="stdx.encoding.json.stream.interface.jsondeserializable.fromjson.fromjson-0fbba982a4" parent="stdx.encoding.json.stream.interface.jsondeserializable.fromjson" -->
# JsonDeserializable<T>.static func fromJson(JsonReader)

[← JsonDeserializable<T>.fromJson](index.md)

## 签名

```cangjie role=signature
public static func fromJson(r: JsonReader): DateTime
```

从 JsonReader 中读取一个 DateTime 实例。

适用扩展：[extend DateTime <: JsonDeserializable<DateTime>](../extensions/extend-datetime-jsondeserializable-datetime.md)。

## 契约

该函数将会把读取到的字符串按照 `RFC3339` 的规范解析，可包含小数秒格式，函数的行为参考 DateTime 的 func parse(String)。

参数：

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

返回值：

- DateTime - DateTime 类型的实例。

异常：

- TimeParseException - 无法正常解析时，抛出异常。
