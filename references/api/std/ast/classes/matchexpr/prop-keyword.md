<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchexpr.prop-keyword" parent="std.ast.class.matchexpr" -->
# MatchExpr.keyword

[← MatchExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keyword: Token
```

获取或设置 MatchExpr 节点中 `match` 关键字。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `matcch` 关键字时，抛出异常。
