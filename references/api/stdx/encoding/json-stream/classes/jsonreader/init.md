<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonreader.init" parent="stdx.encoding.json.stream.class.jsonreader" -->
# JsonReader.init

[← JsonReader](index.md)

## 签名

```cangjie role=signature
public init(inputStream: InputStream)
```

根据输入流创建一个 JsonReader， JsonReader 从输入流中读取数据时，将跳过非 JsonString 中的空字符（'\0', '\t', '\n', '\r'）。

## 契约

参数：

- inputStream: InputStream - 输入的 JSON 数据流。
