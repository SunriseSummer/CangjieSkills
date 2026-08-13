<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonwriter.writevalue" parent="stdx.encoding.json.stream.class.jsonwriter" -->
# JsonWriter.writeValue

[← JsonWriter](index.md)

## 签名

```cangjie role=signature
public func writeValue<T>(v: T): JsonWriter where T <: JsonSerializable
```

将实现了 JsonSerializable 接口的类型写入到 Stream 中。

## 契约

功能：将实现了 JsonSerializable 接口的类型写入到 Stream 中。该接口会调用泛型 T 的 toJson 方法向输出流中写入数据。

json.stream 包已经为基础类型 Int64、UInt64、Float64、Bool、String 类型扩展实现了 JsonSerializable， 并且为 Collection 类型 Array、ArrayList 和 HashMap 扩展实现了 JsonSerializable。

返回值：

- JsonWriter - 返回当前 JsonWriter 的引用。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
