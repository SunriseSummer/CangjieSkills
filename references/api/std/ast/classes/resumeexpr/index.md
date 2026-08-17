<!-- cj-doc kind="api-type" level="5" id="std.ast.class.resumeexpr" parent="std.ast" -->
# ResumeExpr

[← std.ast](../../index.md)

`class ResumeExpr <: Expr`

表示一个 `resume` 表达式节点，可选包含 `with` 和 `throwing` 子句。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut prop keywordR: Token`](prop-keywordr.md) | 获取或设置 `resume` 关键字的词法单元。 |
| [`mut prop keywordW: Option<Token>`](prop-keywordw.md) | 获取或设置 `with` 关键字的词法单元（如果存在）。 |
| [`mut prop withExpr: Option<Expr>`](prop-withexpr.md) | 获取或设置 `with` 关键字之后的表达式。 |
| [`mut prop keywordT: Option<Token>`](prop-keywordt.md) | 获取或设置 `throwing` 关键字的词法单元（如果存在）。 |
| [`mut prop throwingExpr: Option<Expr>`](prop-throwingexpr.md) | 获取或设置 `throwing` 关键字之后的表达式。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()（2 个重载）`](init.md) | 构造一个默认的 ResumeExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`func traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。若要提前终止子节点遍历，可重写 `visit` 函数并调用 `breakTraverse` 函数。请参见自定义访问函数遍历 AST 对象示例。 |

