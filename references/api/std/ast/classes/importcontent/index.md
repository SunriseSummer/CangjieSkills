<!-- cj-doc kind="api-type" level="5" id="std.ast.class.importcontent" parent="std.ast" -->
# ImportContent

[← std.ast](../../index.md)

`ImportContent <: Node`

Node

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut commas: Tokens`](prop-commas.md) | 获取或设置 ImportContent 节点中的 "," 词法单元序列，只有 `importKind` 为 `ImportKind.Multi` 时非空。 |
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置 ImportContent 节点中被导入的项，它可能是包中的顶层定义或声明，也可能是子包的名字。 |
| [`mut importAlias: Tokens`](prop-importalias.md) | 获取或设置 ImportContent 节点中导入的定义或声明的别名词法单元序列，只有 `importKind` 为 `ImportKind.Alias` 时非空。 |
| [`mut importKind: ImportKind`](prop-importkind.md) | 获取或设置 ImportContent 节点中导入类型。 |
| [`mut items: ArrayList<ImportContent>`](prop-items.md) | 获取或设置 ImportContent 节点中被导入的所有项，只有 `importKind` 为 `ImportKind.Multi` 时非空。 |
| [`mut lBrace: Token`](prop-lbrace.md) | 获取或设置 ImportContent 节点中的 `{` 操作符词法单元，只有 `importKind` 为 `ImportKind.Multi` 时非空。 |
| [`mut prefixPaths: Tokens`](prop-prefixpaths.md) | 获取或设置 ImportContent 节点中完整包名的前缀部分的词法单元序列，可能为空。 |
| [`mut prefixDots: Tokens`](prop-prefixdots.md) | 获取或设置 ImportContent 节点中完整包名中用于分隔每层子包的词法单元序列，可能为空。 |
| [`mut rBrace: Token`](prop-rbrace.md) | 获取或设置 ImportContent 节点中的 `}` 操作符词法单元，只有 `importKind` 为 `ImportKind.Multi` 时非空。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ImportContent 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isImportAlias(): Bool`](isimportalias.md) | 判断 ImportContent 节点是否对导入项取了别名。 |
| [`isImportAll(): Bool`](isimportall.md) | 判断 ImportContent 节点是否为全导入。 |
| [`isImportMulti(): Bool`](isimportmulti.md) | 判断 ImportContent 节点是否导入了多个顶级定义或声明。 |
| [`isImportSingle(): Bool`](isimportsingle.md) | 判断 ImportContent 节点是否为单导入。 |
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
