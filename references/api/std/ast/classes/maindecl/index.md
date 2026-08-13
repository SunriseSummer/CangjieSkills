<!-- cj-doc kind="api-type" level="5" id="std.ast.class.maindecl" parent="std.ast" -->
# MainDecl

[← std.ast](../../index.md)

`MainDecl <: Decl`

表示一个 `main` 函数定义节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut block: Block`](prop-block.md) | 获取或设置 MainDecl 节点的函数体。 |
| [`mut colon: Token`](prop-colon.md) | 获取或设置 MainDecl 节点的冒号。 |
| [`mut declType: TypeNode`](prop-decltype.md) | 获取或设置 MainDecl 节点的函数返回类型。 |
| [`mut funcParams: ArrayList<FuncParam>`](prop-funcparams.md) | 获取或设置 MainDecl 节点的函数参数。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 MainDecl 节点的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 MainDecl 节点的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 MainDecl 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 MainDecl 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
