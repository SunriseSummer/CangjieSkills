<!-- cj-doc kind="api-type" level="5" id="std.ast.class.ifexpr" parent="std.ast" -->
# IfExpr

[← std.ast](../../index.md)

`IfExpr <: Expr`

表示条件表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut condition: Expr`](prop-condition.md) | 获取或设置 IfExpr 节点中的 `if` 后的条件表达式。 |
| [`mut elseExpr: Expr`](prop-elseexpr.md) | 获取或设置 IfExpr 节点中 `else` 分支节点。 |
| [`mut ifBlock: Block`](prop-ifblock.md) | 获取或设置 IfExpr 节点中的 `if` 后的 block 节点。 |
| [`mut keywordE: Token`](prop-keyworde.md) | 获取或设置 IfExpr 节点中 `else` 关键字。 |
| [`mut keywordI: Token`](prop-keywordi.md) | 获取或设置 IfExpr 节点中的 `if` 关键字。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 IfExpr 节点中的 `if` 后的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 IfExpr 节点中的 `if` 后的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 IfExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 IfExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
