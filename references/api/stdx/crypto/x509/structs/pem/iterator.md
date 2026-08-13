<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.pem.iterator" parent="stdx.crypto.x509.struct.pem" -->
# Pem.iterator

[← Pem](index.md)

## 签名

```cangjie role=signature
public override func iterator(): Iterator<PemEntry>
```

生成 PEM 文本解码为条目序列的迭代器。

## 契约

返回值：

- Iterator\<PemEntry> - PEM 文本解码为条目序列的迭代器。
