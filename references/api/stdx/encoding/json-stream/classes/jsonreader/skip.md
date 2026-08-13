<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonreader.skip" parent="stdx.encoding.json.stream.class.jsonreader" -->
# JsonReader.skip

[← JsonReader](index.md)

## 签名

```cangjie role=signature
public func skip(): Unit
```

从输入流的当前位置跳过一组数据。

## 契约

> **说明：**
>
> Skip 的规则如下：
>
> - 如果 next token 是 value，跳过这个 value, 跳过 value 时不检查该 value 格式是否正确。
>
> - 如果 next token 是 Name，跳过 (name + value) 这一个组合。
>
> - 如果 next token 是 BeginArray，跳过这个 array。
>
> - 如果 next token 是 BeginObject，跳过这个 object。
>
> - 如果 next token 是 EndArray 或者 EndObject 或者 None，不做任何操作，peek 仍返回 EndArray 或者 EndObject 或者 None。

异常：

- IllegalStateException - 如果输入流的 JSON 数据不符合格式，抛出异常。
