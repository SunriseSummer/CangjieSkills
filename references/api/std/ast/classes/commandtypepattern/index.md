<!-- cj-doc kind="api-type" level="5" id="std.ast.class.commandtypepattern" parent="std.ast" -->
# CommandTypePattern

[← std.ast](../../index.md)

`class CommandTypePattern <: Pattern`

表示一个带有类型注解的命令模式，例如：`pattern: Type1 | Type2 | ...`。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut prop pattern: Pattern`](prop-pattern.md) | 获取或设置冒号（`:`）之前的命令模式。 |
| [`mut prop colon: Token`](prop-colon.md) | 获取或设置用于分隔模式与类型的冒号（`:`）标记。 |
| [`mut prop types: ArrayList<TypeNode>`](prop-types.md) | 获取或设置冒号后面的类型节点列表，例如：`String \| Int \| Float`。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()（2 个重载）`](init.md) | 构建一个默认的 CommandTypePattern 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`func traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。若要提前终止子节点遍历，可重写 `visit` 函数并调用 `breakTraverse` 函数。请参见自定义访问函数遍历 AST 对象示例。 |
