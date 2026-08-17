<!-- cj-doc kind="api-type" level="5" id="std.ast.class.performexpr" parent="std.ast" -->
# PerformExpr

[← std.ast](../../index.md)

`class PerformExpr <: Expr`

表示一个 `perform` 表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut prop expr: Expr`](prop-expr.md) | 获取或设置 PerformExpr 节点中的表达式部分。 |
| [`mut prop keyword: Token`](prop-keyword.md) | 获取或设置 PerformExpr 节点中的 `perform` 关键字。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()（2 个重载）`](init.md) | 构造一个默认的 PerformExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`func traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。若要提前终止子节点遍历，可重写 `visit` 函数并调用 `breakTraverse` 函数。请参见自定义访问函数遍历 AST 对象示例。 |

