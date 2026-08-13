<!-- cj-doc kind="api-type" level="5" id="std.ast.class.constructor" parent="std.ast" -->
# Constructor

[← std.ast](../../index.md)

`Constructor <: Node`

表示 `enum` 类型中的 Constructor 节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut annotations: ArrayList<Annotation>`](prop-annotations.md) | 获取或设置作用于 Constructor 节点的注解列表。 |
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置 Constructor 的标识符词法单元。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 Constructor 节点中的 "(" 词法单元。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 Constructor 节点中的 ")" 词法单元。 |
| [`mut typeArguments: ArrayList<TypeNode>`](prop-typearguments.md) | 获取或设置 Constructor 节点可选的参数类型节点的集合。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Constructor 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
