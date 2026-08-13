<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.struct.writeconfig.prop-usespaceafterseparators" parent="stdx.encoding.json.stream.struct.writeconfig" -->
# WriteConfig.useSpaceAfterSeparators

[← WriteConfig](index.md)

## 签名

```cangjie role=signature
public mut prop useSpaceAfterSeparators: Bool
```

用于表示序列化时在 ':' 和 ',' 后是否加一个空格。

## 契约

该值为 true 时，每插入一个 field name 或者 array 元素后会自动写入一个空格。

该选项只对 json Object 中的 field 以及 json Array 中的元素有效。

类型：Bool
