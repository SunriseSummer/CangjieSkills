<!-- cj-doc kind="api-type" level="5" id="std.ast.class.tryexpr" parent="std.ast" -->
# TryExpr

[← std.ast](../../index.md)

`TryExpr <: Expr`

表示 `try` 表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut catchBlocks: ArrayList<Block>`](prop-catchblocks.md) | 获取或设置 TryExpr 中的 Catch 块。 |
| [`mut catchPatterns: ArrayList<Pattern>`](prop-catchpatterns.md) | 获取或设置 TryExpr 中通过模式匹配的方式匹配待捕获的异常序列。 |
| [`mut finallyBlock: Block`](prop-finallyblock.md) | 获取或设置 TryExpr 中的关键字 `Finally` 块。 |
| [`mut keywordF: Token`](prop-keywordf.md) | 获取或设置 TryExpr 中的 `finally` 关键字。 |
| [`mut keywordT: Token`](prop-keywordt.md) | 获取或设置 TryExpr 中的 `try` 关键字。 |
| [`mut keywordsC: Tokens`](prop-keywordsc.md) | 获取或设置 TryExpr 中的关键字 `catch`。 |
| [`mut resourceSpec: ArrayList<VarDecl>`](prop-resourcespec.md) | 获取或设置 TryExpr 中 Try-with-resources 类型表达式的实例化对象序列。 |
| [`mut tryBlock: Block`](prop-tryblock.md) | 获取或设置 TryExpr 中由表达式与声明组成的块。 |
| [`mut prop handlers: ArrayList<Handler>`](prop-handlers.md) | 获取或设置 `Handler` 节点列表。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 TryExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 TryExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
