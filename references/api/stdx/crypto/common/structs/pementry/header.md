<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.struct.pementry.header" parent="stdx.crypto.common.struct.pementry" -->
# PemEntry.header

[← PemEntry](index.md)

## 签名

```cangjie role=signature
public func header(name: String): Iterator<String>
```

通过条目头名称，找到对应条目内容。

## 参数

- name: String - 条目头名称。

## 返回值

- Iterator<String> - 条目头名称对应内容的迭代器。

