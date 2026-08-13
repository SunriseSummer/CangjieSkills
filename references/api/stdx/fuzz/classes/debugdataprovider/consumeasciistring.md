<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.debugdataprovider.consumeasciistring" parent="stdx.fuzz.fuzz.class.debugdataprovider" -->
# DebugDataProvider.consumeAsciiString

[← DebugDataProvider](index.md)

## 签名

```cangjie role=signature
public override func consumeAsciiString(maxLength: Int64): String
```

将数据转换成 Ascii String 类型实例。

## 契约

参数：

- maxLength: Int64 - String 类型的最大长度。

返回值：

- String - String 类型实例。

异常：

- IllegalArgumentException - 如果 maxLength 为负数，则抛出异常。
