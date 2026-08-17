<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.struct.pem.decode" parent="stdx.crypto.common.struct.pem" -->
# Pem.decode

[← Pem](index.md)

## 签名

```cangjie role=signature
public static func decode(text: String): Pem
```

将 PEM 文本解码为条目序列。

## 参数

- text: String - PEM 字符串。

## 返回值

- Pem - PEM 条目序列。

## 异常

- X509Exception - 数据为空时，或解码失败抛出异常。

