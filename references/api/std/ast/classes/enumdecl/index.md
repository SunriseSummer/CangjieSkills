<!-- cj-doc kind="api-type" level="5" id="std.ast.class.enumdecl" parent="std.ast" -->
# EnumDecl

[← std.ast](../../index.md)

`EnumDecl <: Decl`

表示一个 `Enum` 定义节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut constructors: ArrayList<Constructor>`](prop-constructors.md) | 获取或设置 EnumDecl 节点内 constructor 的成员。 |
| [`mut decls: ArrayList<Decl>`](prop-decls.md) | 获取或设置 EnumDecl 节点内除 constructor 的其他成员。 |
| [`mut ellipsis: Token`](prop-ellipsis.md) | 获取或设置 EnumDecl 节点中可选的 `...` 词法单元，可能为 ILLEGAL 的词法单元类型。 |
| [`mut lBrace: Token`](prop-lbrace.md) | 获取或设置 EnumDecl 节点的 `{` 词法单元类型。 |
| [`mut rBrace: Token`](prop-rbrace.md) | 获取或设置 EnumDecl 节点的 `}` 词法单元类型。 |
| [`mut superTypeBitAnds: Tokens`](prop-supertypebitands.md) | 获取或设置 EnumDecl 节点的父接口声明中的 `&` 操作符的词法单元序列，可能为空。 |
| [`mut superTypes: ArrayList<TypeNode>`](prop-supertypes.md) | 获取或设置 EnumDecl 节点的父接口。 |
| [`mut upperBound: Token`](prop-upperbound.md) | 获取或设置 `<:` 操作符。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 EnumDecl 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 EnumDecl 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
