<!-- cj-doc kind="api-type" level="5" id="std.ast.class.lambdaexpr" parent="std.ast" -->
# LambdaExpr

[← std.ast](../../index.md)

`LambdaExpr <: Expr`

表示 `Lambda` 表达式，是一个匿名的函数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut doubleArrow: Token`](prop-doublearrow.md) | 获取或设置 LambdaExpr 中的 `=>`。 |
| [`mut funcParams: ArrayList<FuncParam>`](prop-funcparams.md) | 获取或设置 LambdaExpr 中的参数列表。 |
| [`mut lBrace: Token`](prop-lbrace.md) | 获取或设置 LambdaExpr 中的 "{"。 |
| [`mut nodes: ArrayList<Node>`](prop-nodes.md) | 获取或设置 LambdaExpr 中的表达式或声明节点。 |
| [`mut rBrace: Token`](prop-rbrace.md) | 获取或设置 LambdaExpr 中的 "}"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 LambdaExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 LambdaExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
