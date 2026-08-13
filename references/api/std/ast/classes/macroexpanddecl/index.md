<!-- cj-doc kind="api-type" level="5" id="std.ast.class.macroexpanddecl" parent="std.ast" -->
# MacroExpandDecl

[← std.ast](../../index.md)

`MacroExpandDecl <: Decl`

表示宏调用节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut fullIdentifier: Token`](prop-fullidentifier.md) | 获取或设置宏调用节点的完整标识符。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 MacroExpandDecl 宏调用的 "("。 |
| [`mut lSquare: Token`](prop-lsquare.md) | 获取或设置 MacroExpandDecl 属性宏调用的 "["。 |
| [`mut macroAttrs: Tokens`](prop-macroattrs.md) | 获取或设置 MacroExpandDecl 属性宏调用的输入。 |
| [`mut macroInputDecl: Decl`](prop-macroinputdecl.md) | 获取或设置 MacroExpandDecl 中的声明节点。 |
| [`mut macroInputs: Tokens`](prop-macroinputs.md) | 获取或设置 MacroExpandDecl 宏调用的输入。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 MacroExpandDecl 宏调用的 ")"。 |
| [`mut rSquare: Token`](prop-rsquare.md) | 获取或设置 MacroExpandDecl 属性宏调用的 "]"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 MacroExpandDecl 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 MacroExpandDecl 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
