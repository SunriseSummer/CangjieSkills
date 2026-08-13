<!-- cj-doc kind="api-type" level="5" id="std.ast.class.spawnexpr" parent="std.ast" -->
# SpawnExpr

[← std.ast](../../index.md)

`SpawnExpr <: Expr`

表示 `Spawn` 表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 SpawnExpr 中的 `spawn` 关键字。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 SpawnExpr 中的 "("。 |
| [`mut lambdaExpr: LambdaExpr`](prop-lambdaexpr.md) | 获取或设置 SpawnExpr 中的不含形参的闭包。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 SpawnExpr 中的 ")"。 |
| [`mut threadContext: Expr`](prop-threadcontext.md) | 获取或设置 SpawnExpr 中的线程上下文环境表达式。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 SpawnExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 SpawnExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
