<!-- cj-doc kind="api-type" level="5" id="std.ast.class.reftype" parent="std.ast" -->
# RefType

[← std.ast](../../index.md)

`RefType <: TypeNode`

表示一个非基础类型节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut commas: Tokens`](prop-commas.md) | 获取或设置 RefType 节点中的 "," 词法单元序列，可能为空。 |
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置构造 RefType 类型的关键字，如 `var a : A = A()` 中的 `A`。 |
| [`mut lAngle: Token`](prop-langle.md) | 获取或设置 RefType 节点中的左尖括号词法单元，可能为 ILLEGAL 的词法单元。 |
| [`mut rAngle: Token`](prop-rangle.md) | 获取或设置 RefType 节点中的右尖括号词法单元，可能为 ILLEGAL 的词法单元。 |
| [`mut typeArguments: ArrayList<TypeNode>`](prop-typearguments.md) | 获取或设置 RefType 节点中的实例化类型的列表，可能为空，如 `var a : Array<Int32>` 中的 Int32。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 RefType 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 RefType 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
