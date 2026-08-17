<!-- cj-doc kind="api-type" level="5" id="std.ast.class.packageheader" parent="std.ast" -->
# PackageHeader

[← std.ast](../../index.md)

`PackageHeader <: Node`

表示包声明节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut accessible: Token`](prop-accessible.md) | 获取或设置 PackageHeader 节点中的访问性修饰符的词法单元，可能为 ILLEGAL 的词法单元。 |
| [`mut keywordM: Token`](prop-keywordm.md) | 获取或设置 PackageHeader 节点中的 `macro` 关键字的词法单元（`M` 为关键字首字母，下同），可能为 ILLEGAL 的词法单元。 |
| [`mut keywordP: Token`](prop-keywordp.md) | 获取或设置 PackageHeader 节点中的 `package` 关键字的词法单元。 |
| [`mut prefixPaths: Tokens`](prop-prefixpaths.md) | 获取或设置 PackageHeader 节点中完整包名的前缀部分的词法单元序列，可能为空。 |
| [`mut prefixDots: Tokens`](prop-prefixdots.md) | 获取或设置 PackageHeader 节点中完整包名中用于分隔每层子包的词法单元序列，可能为空。 |
| [`mut packageIdentifier: Token`](prop-packageidentifier.md) | 获取或设置 PackageHeader 节点中当前包的名字，如果当前包为 root 包，即为完整包名，若当前包为子包，则为最后一个 "." 后的名字。 |
| [`mut prop orgName: Token`](prop-orgname.md) | 获取或设置 PackageHeader 节点中代表组织名的词法单元，setter 会检查 orgSeparator 是否为 "::" 词法单元，若为空则同时设置其为 "::" 词法单元。 |
| [`mut prop orgSeparator: Token`](prop-orgseparator.md) | 获取或设置 PackageHeader 节点中的 "::" 词法单元，setter 会检查 orgName 内容是否为空字符串，若有则抛异常。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 PackageHeader 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 PackageHeader 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
