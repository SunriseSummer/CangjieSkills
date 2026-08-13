<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.pementry.pementry-string-array-string-string-derblob" parent="stdx.crypto.x509.struct.pementry" -->
# PemEntry.PemEntry(String, Array<(String, String)>, ?DerBlob)

[← PemEntry](index.md)

## 签名

```cangjie role=signature
public PemEntry(
    public let label: String,
    public let headers: Array<(String, String)>,
    public let body: ?DerBlob
)
```

构造 PemEntry 对象。

## 契约

参数：

- label: String - 标签。
- headers: Array\<(String, String)> - 条目头。
- body: ?DerBlob - 二进制内容。
