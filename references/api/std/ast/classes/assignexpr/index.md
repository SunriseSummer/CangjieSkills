<!-- cj-doc kind="api-type" level="5" id="std.ast.class.assignexpr" parent="std.ast" -->
# AssignExpr

[← std.ast](../../index.md)

`AssignExpr <: Expr`

表示赋值表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut assign: Token`](prop-assign.md) | 获取或设置 AssignExpr 节点中的赋值操作符（如 `=` 等）。 |
| [`mut leftExpr: Expr`](prop-leftexpr.md) | 获取或设置 AssignExpr 节点中的左操作数。 |
| [`mut rightExpr: Expr`](prop-rightexpr.md) | 获取或设置 AssignExpr 节点中的右操作数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 AssignExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 AssignExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
