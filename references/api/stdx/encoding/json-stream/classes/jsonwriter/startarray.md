<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonwriter.startarray" parent="stdx.encoding.json.stream.class.jsonwriter" -->
# JsonWriter.startArray

[← JsonWriter](index.md)

## 签名

```cangjie role=signature
public func startArray(): Unit
```

开始序列化一个新的 JSON 数组，每一个 startArray 都必须有一个 endArray 对应。

## 契约

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 JSON array 时。
