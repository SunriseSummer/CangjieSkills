<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchcase.prop-keywordw" parent="std.ast.class.matchcase" -->
# MatchCase.keywordW

[← MatchCase](index.md)

## 签名

```cangjie role=signature
public mut prop keywordW: Token
```

获取或设置 MatchCase 中可选的关键字 `where` 的词法单元，可能为 ILLEGAL 的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `where` 关键字时，抛出异常。
