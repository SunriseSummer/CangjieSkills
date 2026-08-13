<!-- cj-doc kind="api-member" level="7" id="std.ast.interface.totokens.totokens.totokens-77f3e70541" parent="std.ast.interface.totokens.totokens" -->
# ToTokens.func toTokens()

[← ToTokens.toTokens](index.md)

## 签名

```cangjie role=signature
public func toTokens(): Tokens
```

实现 Array<T> 类型到 Tokens 类型的转换，仅支持数值类型、Rune 类型、Bool 类型、String 类型。

适用扩展：[extend<T> Array<T> <: ToTokens](../extensions/extend-t-array-t-totokens.md)。

## 契约

返回值：

- Tokens - 转换后的 Tokens。
