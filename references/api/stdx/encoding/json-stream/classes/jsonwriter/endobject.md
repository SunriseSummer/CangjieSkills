<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonwriter.endobject" parent="stdx.encoding.json.stream.class.jsonwriter" -->
# JsonWriter.endObject

[← JsonWriter](index.md)

## 签名

```cangjie role=signature
public func endObject(): Unit
```

结束序列化当前的 JSON object。

## 契约

异常：

- IllegalStateException - 当前 writer 的状态不应该结束一个 JSON object 时。
