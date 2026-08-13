<!-- cj-doc kind="api-type" level="5" id="std.ast.class.qualifiedtype" parent="std.ast" -->
# QualifiedType

[← std.ast](../../index.md)

`QualifiedType <: TypeNode`

表示一个用户自定义成员类型。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut baseType: TypeNode`](prop-basetype.md) | 获取或设置 QualifiedType 节点的成员访问类型主体，如 `var a : T.a` 中的 `T`。 |
| [`mut commas: Tokens`](prop-commas.md) | 获取或设置 QualifiedType 节点中的 "," 词法单元序列，可能为空。 |
| [`mut dot: Token`](prop-dot.md) | 获取或设置 QualifiedType 节点中的 "." 。 |
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置 QualifiedType 节点成员的标识符，如 `var a : T.a` 中的 `a`。 |
| [`mut lAngle: Token`](prop-langle.md) | 获取或设置 QualifiedType 节点中的左尖括号词法单元，可能为 ILLEGAL 的词法单元。 |
| [`mut rAngle: Token`](prop-rangle.md) | 获取或设置 QualifiedType 节点中的右尖括号词法单元，可能为 ILLEGAL 的词法单元。 |
| [`mut typeArguments: ArrayList<TypeNode>`](prop-typearguments.md) | 获取或设置 QualifiedType 节点中的实例化类型的列表，如 `T.a<Int32>` 中的 Int32，列表可能为空。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 QualifiedType 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 QualifiedType 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
