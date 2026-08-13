<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonreader.peek" parent="stdx.encoding.json.stream.class.jsonreader" -->
# JsonReader.peek

[← JsonReader](index.md)

## 签名

```cangjie role=signature
public func peek(): Option<JsonToken>
```

获取输入流的下一个 JsonToken 的类型，不保证下一个 JsonToken 的格式一定正确。

## 契约

例：如果输入流中的下一个字符为 't'，获取的 JsonToken 将为 JsonToken.Bool，但调用 readValue\<Bool>() 不一定成功。

返回值：

- Option\<JsonToken> - 获取到的下一个 JsonToken 的类型，如果到了输入流的结尾返回 None。

异常：

- IllegalStateException - 如果输入流的下一个字符不在以下范围内：(n, t, f, ", 0~9, -, {, }, [, ])。
