<!-- cj-doc kind="api-type" level="5" id="std.ast.struct.token" parent="std.ast" -->
# Token

[← std.ast](../../index.md)

`Token <: ToBytes`

词法单元类型。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`kind: TokenKind`](field-kind.md) | 词法单元的类型。 |
| [`pos: Position`](field-pos.md) | 词法单元在源码中的位置信息。 |
| [`value: String`](field-value.md) | 词法单元的字面量值。 |
| [`delimiterNum: UInt16 = 1`](field-delimiternum.md) | 多行字符串的 '#' 符号个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Token 对象，其中 TokenKind 类型为 `ILLEGAL`，`value` 为空字符串，Position 成员变量均为 0。 |
| [`init(kind: TokenKind)`](init.md) | 根据词法单元类型，构造一个默认的 Token 对象。 |
| [`init(kind: TokenKind, value: String)`](init.md) | 根据词法单元类型 `kind` 和词法单元值 `value`，构造一个 Token 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`addPosition(fileID: UInt32, line: Int32, colum: Int32): Token`](addposition.md) | 补充词法单元的位置信息。 |
| [`dump(): Unit`](dump.md) | 将 Token 的信息打印出来。 |
| [`toBytes(): Array<UInt8>`](tobytes.md) | Token 类型的序列化。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: Token): Bool`](operator-ne.md) | 判断两个 Token 对象是否不相等。 |
| [`operator +(r: Token): Tokens`](operator-add.md) | 使用当前 Token 添加一个 Token 以获取新的 Tokens。 |
| [`operator +(r: Tokens): Tokens`](operator-add.md) | 使用当前 Token 添加一个 Tokens 以获取新的 Tokens。 |
| [`operator ==(r: Token): Bool`](operator-eq.md) | 判断两个 Token 对象是否相等。 |
