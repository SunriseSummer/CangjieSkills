<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tryexpr.prop-keywordf" parent="std.ast.class.tryexpr" -->
# TryExpr.keywordF

[← TryExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordF: Token
```

获取或设置 TryExpr 中的 `finally` 关键字。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `finally` 关键字时，抛出异常。
