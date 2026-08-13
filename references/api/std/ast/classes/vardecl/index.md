<!-- cj-doc kind="api-type" level="5" id="std.ast.class.vardecl" parent="std.ast" -->
# VarDecl

[← std.ast](../../index.md)

`VarDecl <: Decl`

表示变量定义节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut assign: Token`](prop-assign.md) | 获取或设置 VarDecl 节点中的赋值操作符的位置信息。 |
| [`mut colon: Token`](prop-colon.md) | 获取或设置 VarDecl 节点中的冒号位置信息。 |
| [`mut declType: TypeNode`](prop-decltype.md) | 获取或设置 VarDecl 节点的变量类型。 |
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 VarDecl 节点的变量初始化节点。 |
| [`mut pattern: Pattern`](prop-pattern.md) | 获取或设置 VarDecl 节点的 pattern 节点。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 VarDecl 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 VarDecl 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isConst(): Bool`](isconst.md) | 判断是否是一个 `Const` 类型的节点。 |
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
