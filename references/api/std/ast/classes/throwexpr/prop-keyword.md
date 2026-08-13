<!-- cj-doc kind="api-member" level="6" id="std.ast.class.throwexpr.prop-keyword" parent="std.ast.class.throwexpr" -->
# ThrowExpr.keyword

[← ThrowExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keyword: Token
```

获取或设置 ThrowExpr 节点中的关键字。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `throw` 关键字时，抛出异常。
