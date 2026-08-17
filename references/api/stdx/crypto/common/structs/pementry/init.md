<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.struct.pementry.init" parent="stdx.crypto.common.struct.pementry" -->
# PemEntry.init

[← PemEntry](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public PemEntry(
    public let label: String,
    public let headers: Array<(String, String)>,
    public let body: ?DerBlob
)
```

构造 PemEntry 对象。

## 参数

- label: String - 标签。
- headers: Array<(String, String)> - 条目头。
- body: ?DerBlob - 二进制内容。

## 重载 2

### 签名

```cangjie role=signature
public init(label: String, body: DerBlob)
```

构造 PemEntry 对象。

## 参数

- label: String - 标签
- body: DerBlob - 二进制内容

