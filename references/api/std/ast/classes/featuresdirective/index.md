<!-- cj-doc kind="api-type" level="5" id="std.ast.class.featuresdirective" parent="std.ast" -->
# FeaturesDirective

[← std.ast](../../index.md)

`class FeaturesDirective <: Node`

feature directive 节点对象。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut prop annotations: ArrayList<Annotation>`](prop-annotations.md) | 获取或设置在 FeaturesDirective 上的注解。 |
| [`mut prop keyword: Token`](prop-keyword.md) | 获取或设置 FeaturesDirective 节点里的 `features` 关键字。 |
| [`mut prop featuresSet: FeaturesSet`](prop-featuresset.md) | 获取或设置 FeaturesDirective 节点里的 features 名称。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()（2 个重载）`](init.md) | 构造一个默认的 FeaturesDirective 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func toTokens(): Tokens`](totokens.md) | 转换一个语法树节点为 Tokens。 |
| [`func traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。要提前终止子节点遍历，请重写 `visit` 函数并调用 `breakTraverse` 函数来终止遍历行为。参见 自定义访问函数遍历 AST 对象。 |

