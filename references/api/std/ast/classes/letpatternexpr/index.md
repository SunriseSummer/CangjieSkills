<!-- cj-doc kind="api-type" level="5" id="std.ast.class.letpatternexpr" parent="std.ast" -->
# LetPatternExpr

[← std.ast](../../index.md)

`LetPatternExpr <: Expr`

表示 `let` 声明的解构匹配节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut backArrow: Token`](prop-backarrow.md) | 获取或设置 LetPatternExpr 节点中 `<-` 操作符。 |
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 LetPatternExpr 节点中 `<-` 操作符之后的表达式。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 LetPatternExpr 节点中 `let` 关键字。 |
| [`mut pattern: Pattern`](prop-pattern.md) | 获取或设置 LetPatternExpr 节点中 `let` 之后的 pattern。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 LetPatternExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 LetPatternExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
