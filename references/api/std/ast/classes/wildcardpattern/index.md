<!-- cj-doc kind="api-type" level="5" id="std.ast.class.wildcardpattern" parent="std.ast" -->
# WildcardPattern

[← std.ast](../../index.md)

`WildcardPattern <: Pattern`

表示通配符模式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut wildcard: Token`](prop-wildcard.md) | 获取或设置 WildcardPattern 节点中的 "_" 操作符的词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 WildcardPattern 对象。 |
| [`init(keyword: Tokens)`](init.md) | 构造一个 WildcardPattern 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
