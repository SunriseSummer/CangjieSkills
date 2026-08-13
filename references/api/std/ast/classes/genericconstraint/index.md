<!-- cj-doc kind="api-type" level="5" id="std.ast.class.genericconstraint" parent="std.ast" -->
# GenericConstraint

[← std.ast](../../index.md)

`GenericConstraint <: Node`

表示一个泛型约束节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut bitAnds: Tokens`](prop-bitands.md) | 获取或设置 GenericConstraint 节点中的 `&` 操作符的词法单元序列，可能为空。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 GenericConstraint 节点中关键字 `where` 词法单元，可能为 ILLEGAL 的词法单元。 |
| [`mut typeArgument: TypeNode`](prop-typeargument.md) | 获取或设置 GenericConstraint 节点中的约束下界。 |
| [`mut upperBound: Token`](prop-upperbound.md) | 获取或设置 GenericConstraint 节点中的 `<:` 运算符。 |
| [`mut upperBounds: ArrayList<TypeNode>`](prop-upperbounds.md) | 获取或设置 GenericConstraint 节点约束上界的 TypeNode 类型节点的集合。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 GenericConstraint 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
