<!-- cj-doc kind="api-type" level="5" id="std.ast.class.classdecl" parent="std.ast" -->
# ClassDecl

[← std.ast](../../index.md)

`ClassDecl <: Decl`

类定义节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut body: Body`](prop-body.md) | 获取或设置 ClassDecl 节点的类体。 |
| [`mut superTypeBitAnds: Tokens`](prop-supertypebitands.md) | 获取或设置 ClassDecl 节点的父类或父接口声明中的 `&` 操作符的词法单元序列，可能为空。 |
| [`mut superTypes: ArrayList<TypeNode>`](prop-supertypes.md) | 获取或设置 ClassDecl 节点的父类或者父接口。 |
| [`mut upperBound: Token`](prop-upperbound.md) | 获取或设置 `<:` 操作符。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ClassDecl 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ClassDecl 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
