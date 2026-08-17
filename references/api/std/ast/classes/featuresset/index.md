<!-- cj-doc kind="api-type" level="5" id="std.ast.class.featuresset" parent="std.ast" -->
# FeaturesSet

[← std.ast](../../index.md)

`class FeaturesSet <: Node`

一组 features 名称。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut prop lCurl: Token`](prop-lcurl.md) | 获取或设置在 FeaturesSet 节点里的 `{` 。 |
| [`mut prop content: ArrayList<FeatureId>`](prop-content.md) | 获取或设置在 FeaturesSet 节点里的一组 feature id。 |
| [`mut prop commas: Tokens`](prop-commas.md) | 获取或设置在 FeaturesSet 节点里的一组 `,`。 |
| [`mut prop rCurl: Token`](prop-rcurl.md) | 获取或设置在 FeaturesSet 节点里的 `}` 。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 FeaturesSet 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func toTokens(): Tokens`](totokens.md) | 转换一个语法树节点为 Tokens。 |
| [`func traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。要提前终止子节点遍历，请重写 `visit` 函数并调用 `breakTraverse` 函数来终止遍历行为。参见 自定义访问函数遍历 AST 对象。 |

