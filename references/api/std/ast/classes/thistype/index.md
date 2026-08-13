<!-- cj-doc kind="api-type" level="5" id="std.ast.class.thistype" parent="std.ast" -->
# ThisType

[← std.ast](../../index.md)

`ThisType <: TypeNode`

表示 `This` 类型节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 ThisType 节点关键字 `This` 的词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ThisType 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ThisType 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
