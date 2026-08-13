<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonwriter.endarray" parent="stdx.encoding.json.stream.class.jsonwriter" -->
# JsonWriter.endArray

[← JsonWriter](index.md)

## 签名

```cangjie role=signature
public func endArray(): Unit
```

结束序列化当前的 JSON 数组。

## 契约

异常：

- IllegalStateException - 当前 writer 没有匹配的 startArray 时。
