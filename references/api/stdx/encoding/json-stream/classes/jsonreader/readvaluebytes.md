<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonreader.readvaluebytes" parent="stdx.encoding.json.stream.class.jsonreader" -->
# JsonReader.readValueBytes

[← JsonReader](index.md)

## 签名

```cangjie role=signature
public func readValueBytes(): Array<Byte>
```

读取输入流的下一组原始数据(字节数组)，不进行转义等操作。

## 契约

> **说明：**
>
> readValueBytes 的规则如下：
>
> - 如果 next token 是 value，则读取这个 value 的所有原始字节，直到读取到代表结束的符号，如 ',' '}' ']'。
>
> - 如果 next token 是 Name，读取 (name + value) 这一个组合的原始字节数组。
>
> - 如果 next token 是 BeginArray，读取 Array 内的内的所有原始字节。
>
> - 如果 next token 是 BeginObject，读取 Object 内的内的所有原始字节。
>
> - 如果 next token 是 EndArray 或者 EndObject 或者 None，不做任何操作，返回空的数组，再次执行 peek() 仍返回 EndArray 或者 EndObject 或者 None。

返回值：

- Array\<Byte> - 下一组数据对应的原始字节数据。

异常：

- IllegalStateException - 如果输入流的 JSON 数据不符合格式，抛出异常。
