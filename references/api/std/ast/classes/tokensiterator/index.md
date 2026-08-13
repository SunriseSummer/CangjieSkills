<!-- cj-doc kind="api-type" level="5" id="std.ast.class.tokensiterator" parent="std.ast" -->
# TokensIterator

[← std.ast](../../index.md)

`TokensIterator <: Iterator<Token>`

实现 Tokens 的迭代器功能。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(tokens: Tokens)`](init.md) | 构造一个 TokensIterator 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`next(): Option<Token>`](next.md) | 获取迭代器中的下一个值。 |
| [`peek(): Option<Token>`](peek.md) | 获取迭代器中的当前值。 |
| [`seeing(kind: TokenKind): Bool`](seeing.md) | 判断当前节点的 Token 类型是否是传入的类型。 |
