<!-- cj-doc kind="api-member" level="7" id="std.ast.interface.totokens.totokens.totokens-1eb553dea2" parent="std.ast.interface.totokens.totokens" -->
# ToTokens.func toTokens()

[← ToTokens.toTokens](index.md)

## 签名

```cangjie role=signature
public func toTokens(): Tokens
```

实现 ArrayList 类型到 Tokens 类型的转换，目前支持的类型有 Decl、Node、Constructor、Argument、FuncParam、MatchCase、Modifier、Annotation、ImportList、Pattern、TypeNode 等。

适用扩展：[extend<T> ArrayList<T> <: ToTokens](../extensions/extend-t-arraylist-t-totokens.md)。

## 契约

返回值：

- Tokens - 转换后的 Tokens。
