<!-- cj-doc kind="api-type" level="5" id="std.ast.class.body" parent="std.ast" -->
# Body

[← std.ast](../../index.md)

`Body <: Node`

表示 Class 类型、 Struct 类型、 Interface 类型以及扩展中由 `{}` 和内部的一组声明节点组成的结构。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut decls: ArrayList<Decl>`](prop-decls.md) | 获取或设置 Body 内的声明节点集合。 |
| [`mut lBrace: Token`](prop-lbrace.md) | 获取或设置 `{` 词法单元。 |
| [`mut rBrace: Token`](prop-rbrace.md) | 获取或设置 `}` 词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Body 对象。 |
| [`init(decls: ArrayList<Decl>)`](init.md) | 构造一个 Body 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
