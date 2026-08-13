<!-- cj-doc kind="api-type" level="5" id="std.ast.class.callexpr" parent="std.ast" -->
# CallExpr

[← std.ast](../../index.md)

`CallExpr <: Expr`

表示函数调用表达式；`callFunc` 是被调用表达式，`arguments` 是实参列表。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut arguments: ArrayList<Argument>`](prop-arguments.md) | 获取或设置 CallExpr 节点中函数参数。 |
| [`mut callFunc: Expr`](prop-callfunc.md) | 获取或设置 CallExpr 节点中的函数调用节点。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 CallExpr 节点中的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 CallExpr 节点中的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 CallExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 CallExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
