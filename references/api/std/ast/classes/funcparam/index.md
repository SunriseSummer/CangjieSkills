<!-- cj-doc kind="api-type" level="5" id="std.ast.class.funcparam" parent="std.ast" -->
# FuncParam

[← std.ast](../../index.md)

`open FuncParam <: Decl`

表示函数参数节点，包括非命名参数和命名参数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut assign: Token`](prop-assign.md) | 获取或设置具有默认值的函数参数中的 `=`。 |
| [`mut colon: Token`](prop-colon.md) | 获取或设置置形参中的 ":"。 |
| [`mut expr: Expr`](prop-expr.md) | 获取或设置具有默认值的函数参数的变量初始化节点。 |
| [`mut not: Token`](prop-not.md) | 获取或设置命名形参中的 `!`。 |
| [`mut paramType: TypeNode`](prop-paramtype.md) | 获取或设置函数参数的类型。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 FuncParam 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 FuncParam 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`protected open dump(indent: UInt16): String`](dump.md) | 将当前语法树节点转化为树形结构的形态并进行打印。 |
| [`isMemberParam(): Bool`](ismemberparam.md) | 当前的函数参数是否是主构造函数中的参数。 |
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
