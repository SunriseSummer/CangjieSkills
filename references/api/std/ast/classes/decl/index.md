<!-- cj-doc kind="api-type" level="5" id="std.ast.class.decl" parent="std.ast" -->
# Decl

[← std.ast](../../index.md)

`open Decl <: Node`

所有声明节点的父类，继承自 Node 节点，提供了所有声明节点的通用接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`protected var identifier_: Token`](field-identifier_.md) | 获取或设置声明节点的标识符，如 `class foo {}` 中的 `foo`。 |
| [`protected var keyword_: Token`](field-keyword_.md) | 获取或设置声明节点的关键字。 |
| [`protected var modifiers_: ArrayList<Modifier>`](field-modifiers_.md) | 获取或设置节点的修饰符列表。 |
| [`protected var node: Node`](field-node.md) | 获取或设置Decl 节点的形参节点。 |
| [`mut annotations: ArrayList<Annotation>`](prop-annotations.md) | 获取或设置作用于 Decl 节点的注解列表。 |
| [`mut constraintCommas: Tokens`](prop-constraintcommas.md) | 获取或设置 Decl 节点中的 "," 词法单元序列，可能为空。 |
| [`mut genericConstraint: ArrayList<GenericConstraint>`](prop-genericconstraint.md) | 获取或设置声明节点的泛型约束，可能为空，如 `func foo<T>() where T <: Comparable<T> {}` 中的 `where T <: Comparable<T>`。 |
| [`mut genericParam: GenericParam`](prop-genericparam.md) | 获取或设置形参列表，类型形参列表由 `<>` 括起，多个类型形参之间用逗号分隔。 |
| [`mut open identifier: Token`](prop-identifier.md) | 获取或设置声明节点的标识符，如 `class foo {}` 中的 `foo`。 |
| [`mut isGenericDecl: Bool`](prop-isgenericdecl.md) | 判断是否是一个泛型节点。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置声明节点的关键字。 |
| [`mut modifiers: ArrayList<Modifier>`](prop-modifiers.md) | 获取或设置节点的修饰符列表。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`protected open dump(indent: UInt16): String`](dump.md) | 将当前语法树节点转化为树形结构的形态并进行打印。 |
| [`getAttrs(): Tokens`](getattrs.md) | 获取当前节点的属性（一般通过内置的 `Attribute` 来设置某个声明设置属性值）。 |
| [`hasAttr(attr: String): Bool`](hasattr.md) | 判断当前节点是否具有某个属性（一般通过内置的 `Attribute` 来设置某个声明的属性值）。 |
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
