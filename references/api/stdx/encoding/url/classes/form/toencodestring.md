<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.form.toencodestring" parent="stdx.encoding.url.class.form" -->
# Form.toEncodeString

[← Form](index.md)

## 签名

```cangjie role=signature
public func toEncodeString(): String
```

对表单中的键值对进行编码，编码采用百分号编码。

## 契约

未保留字符不会被编码，空格将编码为 '+'。

> **说明：**
>
> RFC 3986 协议中对未保留字符定义如下： unreserved = ALPHA / DIGIT / "-" / "." / "_" / "~"

返回值：

- String - 编码后的字符串。
