<!-- cj-doc kind="api-type" level="5" id="std.ast.class.program" parent="std.ast" -->
# Program

[← std.ast](../../index.md)

`Program <: Node`

表示一个仓颉源码文件节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut decls: ArrayList<Decl>`](prop-decls.md) | 获取或设置仓颉源码文件中 TopLevel 作用域内定义的声明节点列表。 |
| [`mut importLists: ArrayList<ImportList>`](prop-importlists.md) | 获取或设置仓颉源码文件中包导入节点 ImportList 的列表。 |
| [`mut packageHeader: PackageHeader`](prop-packageheader.md) | 获取或设置仓颉源码文件中包的声明节点 PackageHeader。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Program 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 Program 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
