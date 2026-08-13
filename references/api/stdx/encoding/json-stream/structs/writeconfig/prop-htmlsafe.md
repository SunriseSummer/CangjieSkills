<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.struct.writeconfig.prop-htmlsafe" parent="stdx.encoding.json.stream.struct.writeconfig" -->
# WriteConfig.htmlSafe

[← WriteConfig](index.md)

## 签名

```cangjie role=signature
public mut prop htmlSafe: Bool
```

用于表示是否转义 HTML 字符 `<`、`>`、`&`、`=`和`'`。

## 契约

该值为 true 时，会将 HTML 字符转义为对应的 Unicode 编码的字符串。

该选项只对 json value 中的字符串字面量有效。

类型：Bool
