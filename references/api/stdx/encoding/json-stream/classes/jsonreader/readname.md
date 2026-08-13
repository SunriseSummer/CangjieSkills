<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonreader.readname" parent="stdx.encoding.json.stream.class.jsonreader" -->
# JsonReader.readName

[← JsonReader](index.md)

## 签名

```cangjie role=signature
public func readName(): String
```

从输入流的当前位置读取一个 name。

## 契约

返回值：

- String - 读取出的 name 值。

异常：

- IllegalStateException - 如果输入流的 JSON 数据不符合格式，抛出异常。
