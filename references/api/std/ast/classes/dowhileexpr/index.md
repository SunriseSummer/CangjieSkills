<!-- cj-doc kind="api-type" level="5" id="std.ast.class.dowhileexpr" parent="std.ast" -->
# DoWhileExpr

[← std.ast](../../index.md)

`DoWhileExpr <: Expr`

表示 `do-while` 表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut block: Block`](prop-block.md) | 获取或设置 DoWhileExpr 中的块表达式。 |
| [`mut condition: Expr`](prop-condition.md) | 获取或设置关键字 DoWhileExpr 中的条件表达式。 |
| [`mut keywordD: Token`](prop-keywordd.md) | 获取或设置 DoWhileExpr 节点中 `do` 关键字，其中 keywordD 中的 D 为关键字 `do` 的首字母大写，代表关键字 `do` 。 |
| [`mut keywordW: Token`](prop-keywordw.md) | 获取或设置 DoWhileExpr 节点中 `while` 关键字，其中 keywordW 中的 W 为关键字 `while` 的首字母大写，代表关键字 `while` 。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 DoWhileExpr 中 `while` 关键字之后的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 DoWhileExpr 中 `while` 关键字之后的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 DoWhileExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 DoWhileExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
