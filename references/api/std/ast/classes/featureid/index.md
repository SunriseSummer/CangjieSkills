<!-- cj-doc kind="api-type" level="5" id="std.ast.class.featureid" parent="std.ast" -->
# FeatureId

[← std.ast](../../index.md)

`class FeatureId <: Node`

表示一个 feature id。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut prop identifiers: Tokens`](prop-identifiers.md) | 获取或设置 FeatureId 节点的标识符。 |
| [`mut prop dots: Tokens`](prop-dots.md) | 获取或设置 feature 的点号。例如：`features { user.define.sample }`。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个 FeatureId 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func toTokens(): Tokens`](totokens.md) | 转换当前的抽象语法树节点为 Tokens 类型。 |
| [`func traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。要提前终止子节点遍历，请重写 `visit` 函数并调用 `breakTraverse` 函数来终止遍历行为。参见 自定义访问函数遍历 AST 对象。 |

