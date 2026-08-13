<!-- cj-doc kind="api-member" level="5" id="stdx.encoding.hex.func.fromhexstring-string" parent="stdx.encoding.hex" -->
# fromHexString(String)

[← stdx.encoding.hex](../index.md)

## 签名

```cangjie role=signature
public func fromHexString(data: String): Option<Array<Byte>>
```

此函数用于 Hex 编码的字符串的解码。

## 契约

参数：

- data: String - 要解码的 Hex 编码的字符串。

返回值：

- Option\<Array\<Byte>> - 输入空字符串会返回 Option\<Array\<Byte>>.Some(Array\<Byte>())，解码失败会返回 Option\<Array\<Byte>>.None。
