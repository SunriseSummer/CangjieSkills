<!-- cj-doc kind="api-type" level="5" id="std.ast.class.genericparam" parent="std.ast" -->
# GenericParam

[← std.ast](../../index.md)

`GenericParam <: Node`

表示一个类型形参节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut lAngle: Token`](prop-langle.md) | 获取或设置 GenericParam 节点中的左尖括号词法单元。 |
| [`mut parameters: Tokens`](prop-parameters.md) | 获取或设置 GenericParam 节点中的类型形参的 Tokens 类型，可能为空，如 `<T1, T2, T3>` 中的 `T1` `T2` 和 `T3`。 |
| [`mut rAngle: Token`](prop-rangle.md) | 获取或设置 GenericParam 节点中的右尖括号词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 GenericParam 对象。 |
| [`init(parameters: Tokens)`](init.md) | 构造一个 GenericParam 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
