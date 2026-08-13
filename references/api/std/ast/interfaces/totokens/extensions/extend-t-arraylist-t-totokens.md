<!-- cj-doc kind="api-extension" level="6" id="std.ast.interface.totokens.extension.extend-t-arraylist-t-totokens" parent="std.ast.interface.totokens" -->
# extend<T> ArrayList<T> <: ToTokens

[← ToTokens](../index.md)

`extend<T> ArrayList<T> <: ToTokens`

实现 ArrayList<T> 类型到 Tokens 类型的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](../totokens/index.md) | 实现 ArrayList 类型到 Tokens 类型的转换，目前支持的类型有 Decl、Node、Constructor、Argument、FuncParam、MatchCase、Modifier、Annotation、ImportList、Pattern、TypeNode 等。 |
