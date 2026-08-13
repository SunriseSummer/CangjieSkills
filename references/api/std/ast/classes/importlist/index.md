<!-- cj-doc kind="api-type" level="5" id="std.ast.class.importlist" parent="std.ast" -->
# ImportList

[← std.ast](../../index.md)

`ImportList <: Node`

表示包导入节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut content: ImportContent`](prop-content.md) | 获取或设置 ImportList 节点中的被导入的具体项。 |
| [`mut keywordI: Token`](prop-keywordi.md) | 获取或设置 ImportList 节点中的 `import` 关键字的词法单元，`I` 为关键字首字母。 |
| [`mut modifier: Token`](prop-modifier.md) | 获取或设置 ImportList 节点中的修饰符，可能为 ILLEGAL 的词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ImportList 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ImportList 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isImportMulti(): Bool`](isimportmulti.md) | 判断 ImportList 节点是否导入了多个顶级定义或声明。 |
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
