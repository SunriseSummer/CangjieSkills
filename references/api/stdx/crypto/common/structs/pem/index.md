<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.struct.pem" parent="stdx.crypto.common" -->
# Pem

[← stdx.crypto.common](../../index.md)

`struct Pem <: Collection<PemEntry> & ToString`

结构体 Pem 为条目序列，可以包含多个 PemEntry。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`override prop size: Int64`](prop-size.md) | 条目序列的数量。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`Pem(private let items: Array<PemEntry>)`](init.md) | 构造 Pem 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static func decode(text: String): Pem`](decode.md) | 将 PEM 文本解码为条目序列。 |
| [`func encode(): String`](encode.md) | 返回 PEM 格式的字符串。行结束符将根据当前操作系统生成。 |
| [`override func isEmpty(): Bool`](isempty.md) | 判断 PEM 文本解码为条目序列是否为空。 |
| [`override func iterator(): Iterator<PemEntry>`](iterator.md) | 生成 PEM 文本解码为条目序列的迭代器。 |
| [`override func toString(): String`](tostring.md) | 返回一个字符串，字符串内容是包含每个条目序列的标签。 |

