<!-- cj-doc kind="api-type" level="5" id="std.ast.class.annotation" parent="std.ast" -->
# Annotation

[← std.ast](../../index.md)

`Annotation <: Node`

表示编译器内置的注解节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut arguments: ArrayList<Argument>`](prop-arguments.md) | 获取或设置 Annotation 中的参数序列，如 `@CallingConv[xxx]` 中的 `xxx`。 |
| [`mut at: Token`](prop-at.md) | 获取或设置 Annotation 节点中的 `@` 操作符或 `@!` 操作符。 |
| [`mut attributes: Tokens`](prop-attributes.md) | 获取或设置 `Attribute` 中设置的属性值，仅用于 `@Attribute`，如 `@Attribute[xxx]` 中的 `xxx`。 |
| [`mut condition: Expr`](prop-condition.md) | 获取或设置条件编译中的条件表达式，用于 `@When`，如 `@When[xxx]` 中的 `xxx`。 |
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置 Annotation 节点的标识符，如 `@CallingConv[xxx]` 中的 `CallingConv`。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Annotation 对象。 |
| [`init(inputs: Tokens)`](init.md) | 根据输入的词法单元，构造一个 Annotation 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
