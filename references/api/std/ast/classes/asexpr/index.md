<!-- cj-doc kind="api-type" level="5" id="std.ast.class.asexpr" parent="std.ast" -->
# AsExpr

[← std.ast](../../index.md)

`AsExpr <: Expr`

表示一个类型检查表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 AsExpr 节点中的表达式节点。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 AsExpr 节点中的 `as` 操作符。 |
| [`mut shiftType: TypeNode`](prop-shifttype.md) | 获取或设置 AsExpr 节点中的目标类型。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 AsExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 AsExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
