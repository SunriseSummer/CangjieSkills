<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.struct.writeconfig.prop-indent" parent="stdx.encoding.json.stream.struct.writeconfig" -->
# WriteConfig.indent

[← WriteConfig](index.md)

## 签名

```cangjie role=signature
public mut prop indent: String
```

用于表示序列化时每个缩进级别填入的缩进字符串。

## 契约

功能：用于表示序列化时每个缩进级别填入的缩进字符串。取值应匹配正则 `^[ \t]*$`。

当上述的换行起作用时，该值会作为换行后的填充符。

类型：String

异常：

- IllegalArgumentException - 设置的字符串包含 ' ' 或者 '\t' 以外的字符。
