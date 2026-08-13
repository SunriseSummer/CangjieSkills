<!-- cj-doc kind="api-type" level="5" id="std.ast.class.whileexpr" parent="std.ast" -->
# WhileExpr

[← std.ast](../../index.md)

`WhileExpr <: Expr`

表示 `while` 表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut block: Block`](prop-block.md) | 获取或设置 WhileExpr 中的块节点。 |
| [`mut condition: Expr`](prop-condition.md) | 获取或设置关键字 WhileExpr 中的条件表达式。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 WhileExpr 节点中 `while` 关键字。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 WhileExpr 中 `while` 关键字之后的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 WhileExpr 中 `while` 关键字之后的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 WhileExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 WhileExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
