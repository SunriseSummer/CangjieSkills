<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonreader.startarray" parent="stdx.encoding.json.stream.class.jsonreader" -->
# JsonReader.startArray

[← JsonReader](index.md)

## 签名

```cangjie role=signature
public func startArray(): Unit
```

从输入流的当前位置跳过空白字符后消耗一个 '[' 字符。

## 契约

异常：

- IllegalStateException - 如果输入流的 JSON 数据不符合格式，抛出异常。
