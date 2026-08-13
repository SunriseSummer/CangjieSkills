<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonreader.readvalue" parent="stdx.encoding.json.stream.class.jsonreader" -->
# JsonReader.readValue

[← JsonReader](index.md)

## 签名

```cangjie role=signature
public func readValue<T>(): T where T <: JsonDeserializable<T>
```

从输入流的当前位置读取一个 value。

## 契约

> **注意：**
>
> 当泛型 T 是 String 类型时，根据下一个 JsonToken 的不同，该函数的返回值将会不同：
>
> - 当下一个 JsonToken 是 JsonString 时， 反序列化过程会按照标准 ECMA-404 The JSON Data Interchange Standard 对读到的 String 进行转义。
>
> - 当下一个 JsonToken 是 JsonInt JsonFloat JsonBool JsonNull 其中一个时，将会读取下一个 `value` 字段的原始字符串并返回。
>
> - 当下一个 JsonToken 是其它类型时，调用此接口会抛异常。

返回值：

- T - 读取出的 value 值。

异常：

- IllegalStateException - 如果输入流的 JSON 数据不符合格式，抛出异常。
