<!-- cj-doc kind="api-type" level="5" id="std.ast.class.refexpr" parent="std.ast" -->
# RefExpr

[← std.ast](../../index.md)

`RefExpr <: Expr`

表示引用一个声明的表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut commas: Tokens`](prop-commas.md) | 获取或设置 RefExpr 节点中的 "," 词法单元序列，可能为空。 |
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置 RefExpr 节点中的自定义类型的标识符。 |
| [`mut lAngle: Token`](prop-langle.md) | 获取或设置 RefExpr 节点中的左尖括号。 |
| [`mut rAngle: Token`](prop-rangle.md) | 获取或设置 RefExpr 节点中的右尖括号。 |
| [`mut typeArguments: ArrayList<TypeNode>`](prop-typearguments.md) | 获取或设置 RefExpr 节点中的实例化类型。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 RefExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 RefExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
