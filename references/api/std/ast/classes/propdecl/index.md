<!-- cj-doc kind="api-type" level="5" id="std.ast.class.propdecl" parent="std.ast" -->
# PropDecl

[← std.ast](../../index.md)

`PropDecl <: Decl`

表示一个属性定义节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut colon: Token`](prop-colon.md) | 获取或设置 PropDecl 节点的冒号。 |
| [`mut declType : TypeNode`](prop-decltype.md) | 获取或设置 PropDecl 节点的返回类型。 |
| [`mut getter: FuncDecl`](prop-getter.md) | 获取或设置 PropDecl 节点的 getter 函数。 |
| [`mut lBrace: Token`](prop-lbrace.md) | 获取或设置 PropDecl 节点的 "{"。 |
| [`mut rBrace: Token`](prop-rbrace.md) | 获取或设置 PropDecl 节点的 "}"。 |
| [`mut setter: FuncDecl`](prop-setter.md) | 获取或设置 PropDecl 节点的 setter 函数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 PropDecl 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 PropDecl 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
