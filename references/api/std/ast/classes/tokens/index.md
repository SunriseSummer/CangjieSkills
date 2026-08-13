<!-- cj-doc kind="api-type" level="5" id="std.ast.class.tokens" parent="std.ast" -->
# Tokens

[← std.ast](../../index.md)

`open Tokens <: ToString & Iterable<Token> & ToBytes`

对 Token 序列进行封装的类型。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`protected var tokens: ArrayList<Token>`](field-tokens.md) | 获取或设置内部以ArrayList<Token>格式存储的全部Token。 |
| [`open size: Int64`](prop-size.md) | 获取 Tokens 对象中 Token 类型的数量。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Tokens 对象。 |
| [`init(tokArray: Array<Token>)`](init.md) | 构造一个 Tokens 对象。 |
| [`init(tokArrayList: ArrayList<Token>)`](init.md) | 构造一个 Tokens 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`append(node: Node): Tokens`](append.md) | 将当前的 Tokens 与传入节点所转换得到的 Tokens 进行拼接。 |
| [`open append(token: Token): Tokens`](append.md) | 将当前的 Tokens 与传入的 Token 进行拼接。 |
| [`open append(tokens: Tokens): Tokens`](append.md) | 在当前的 Tokens 后追加传入的 Tokens 进行拼接（该接口性能较其他拼接函数表现更好）。 |
| [`concat(tokens: Tokens): Tokens`](concat.md) | 将当前的 Tokens 与传入的 Tokens 进行拼接。 |
| [`dump(): Unit`](dump.md) | 将 Tokens 内所有 Token 的信息打印出来。 |
| [`open get(index: Int64): Token`](get.md) | 通过索引值获取 Token 元素。 |
| [`iterator(): TokensIterator`](iterator.md) | 获取 Tokens 对象中的一个迭代器对象。 |
| [`remove(index: Int64): Tokens`](remove.md) | 删除指定位置的 Token 对象。 |
| [`toBytes(): Array<UInt8>`](tobytes.md) | Tokens 类型的序列化。 |
| [`toString(): String`](tostring.md) | 将 Tokens 转化为 String 类型。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator +(r: Token): Tokens`](operator-add.md) | 使用当前 Tokens 与另一个 Token 相加以获取新的 Tokens。 |
| [`operator +(r: Tokens): Tokens`](operator-add.md) | 使用当前 Tokens 与 Tokens 相加以获取新的 Tokens 类型。 |
| [`operator [](index: Int64): Token`](operator-indexer.md) | 操作符重载，通过索引值获取对应 Token。 |
| [`open operator [](range: Range<Int64>): Tokens`](operator-indexer.md) | 操作符重载，通过 `range` 获取对应 Tokens 切片。 |
