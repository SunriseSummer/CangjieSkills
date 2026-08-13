<!-- cj-doc kind="api-type" level="5" id="std.ast.class.forinexpr" parent="std.ast" -->
# ForInExpr

[← std.ast](../../index.md)

`ForInExpr <: Expr`

表示 `for-in` 表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut block: Block`](prop-block.md) | 获取或设置 ForInExpr 中的循环体。 |
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 ForInExpr 中的表达式。 |
| [`mut keywordF: Token`](prop-keywordf.md) | 获取或设置 ForInExpr 中的关键字 `for`。 |
| [`mut keywordI: Token`](prop-keywordi.md) | 获取或设置 ForInExpr 中的关键字 `in`。 |
| [`mut keywordW: Token`](prop-keywordw.md) | 获取或设置 ForInExpr 中的关键字 `where`。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 ForInExpr 中关键字 `for` 后的 "("。 |
| [`mut pattern: Pattern`](prop-pattern.md) | 获取或设置 ForInExpr 中的 Pattern 节点。 |
| [`mut patternGuard: Expr`](prop-patternguard.md) | 获取或设置 ForInExpr 中的 `patternGuard` 条件表达式。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 ForInExpr 中的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ForInExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ForInExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
