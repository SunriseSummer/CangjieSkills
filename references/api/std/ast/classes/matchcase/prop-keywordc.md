<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchcase.prop-keywordc" parent="std.ast.class.matchcase" -->
# MatchCase.keywordC

[← MatchCase](index.md)

## 签名

```cangjie role=signature
public mut prop keywordC: Token
```

获取或设置 MatchCase 内的 `case` 关键字的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `case` 关键字时，抛出异常。
