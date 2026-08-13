<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchcase.prop-bitors" parent="std.ast.class.matchcase" -->
# MatchCase.bitOrs

[← MatchCase](index.md)

## 签名

```cangjie role=signature
public mut prop bitOrs: Tokens
```

获取或设置 MatchCase 中的 `|` 操作符的词法单元序列，可能为空。

## 契约

类型：Tokens

异常：

- ASTException - 当设置的 Tokens 不是 `|` 词法单元序列时，抛出异常。
