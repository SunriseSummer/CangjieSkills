<!-- cj-doc kind="api-type" level="5" id="std.ast.class.synchronizedexpr" parent="std.ast" -->
# SynchronizedExpr

[← std.ast](../../index.md)

`SynchronizedExpr <: Expr`

表示 `synchronized` 表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut block: Block`](prop-block.md) | 获取或设置 SynchronizedExpr 修饰的代码块。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 SynchronizedExpr 中的 `synchronized` 关键字。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 SynchronizedExpr 中的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 SynchronizedExpr 中的 ")"。 |
| [`mut structuredMutex: Expr`](prop-structuredmutex.md) | 获取或设置 SynchronizedExpr 中的 `StructuredMutex` 的对象。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 SynchronizedExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 SynchronizedExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
