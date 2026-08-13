<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.pem" parent="stdx.crypto.x509" -->
# Pem

[← stdx.crypto.x509](../../index.md)

`Pem <: Collection<PemEntry> & ToString`

结构体 Pem 为条目序列，可以包含多个 PemEntry。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`override size: Int64`](prop-size.md) | 条目序列的数量。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`Pem(private let items: Array<PemEntry>)`](pem-array-pementry.md) | 构造 Pem 对象。 |
| [`static decode(text: String): Pem`](decode.md) | 将 PEM 文本解码为条目序列。 |
| [`encode(): String`](encode.md) | 返回 PEM 格式的字符串。 |
| [`override isEmpty(): Bool`](isempty.md) | 判断 PEM 文本解码为条目序列是否为空。 |
| [`override iterator(): Iterator<PemEntry>`](iterator.md) | 生成 PEM 文本解码为条目序列的迭代器。 |
| [`override toString(): String`](tostring.md) | 返回一个字符串，字符串内容是包含每个条目序列的标签。 |
