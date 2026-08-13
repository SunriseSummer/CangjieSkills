<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.struct.writeconfig.prop-newline" parent="stdx.encoding.json.stream.struct.writeconfig" -->
# WriteConfig.newline

[← WriteConfig](index.md)

## 签名

```cangjie role=signature
public mut prop newline: String
```

用于表示序列化时填入的换行符。

## 契约

功能：用于表示序列化时填入的换行符。取值应匹配正则 `^[\r\n]*$` 。

当该值不为空字符串且合法时，JsonWriter 调用 startObject 和 startArray 操作、插入元素、以及它们的结束操作会产生新的换行。

当该值为空字符串时，不会触发换行。

类型：String

异常：

- IllegalArgumentException - 设置的字符串包含 '\r' 或者 '\n' 以外的字符。
