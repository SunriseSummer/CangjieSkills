<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.pem.encode" parent="stdx.crypto.x509.struct.pem" -->
# Pem.encode

[← Pem](index.md)

## 签名

```cangjie role=signature
public func encode(): String
```

返回 PEM 格式的字符串。

## 契约

功能：返回 PEM 格式的字符串。行结束符将根据当前操作系统生成。

返回值：

- String - PEM 格式的字符串。
