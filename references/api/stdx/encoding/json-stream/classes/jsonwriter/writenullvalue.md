<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonwriter.writenullvalue" parent="stdx.encoding.json.stream.class.jsonwriter" -->
# JsonWriter.writeNullValue

[← JsonWriter](index.md)

## 签名

```cangjie role=signature
public func writeNullValue(): JsonWriter
```

向流中写入 JSON value null。

## 契约

返回值：

- JsonWriter - 为方便链式调用，返回值为当前 JsonWriter 的引用。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时
