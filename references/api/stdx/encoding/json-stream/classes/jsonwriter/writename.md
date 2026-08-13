<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonwriter.writename" parent="stdx.encoding.json.stream.class.jsonwriter" -->
# JsonWriter.writeName

[← JsonWriter](index.md)

## 签名

```cangjie role=signature
public func writeName(name: String): JsonWriter
```

在 object 结构中写入 name。

## 契约

返回值：

- JsonWriter - 当前 JsonWriter 引用。

异常：

- IllegalStateException - 当前 JsonWriter 的状态不应写入参数 `name` 指定字符串时。
