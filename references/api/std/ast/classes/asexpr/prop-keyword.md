<!-- cj-doc kind="api-member" level="6" id="std.ast.class.asexpr.prop-keyword" parent="std.ast.class.asexpr" -->
# AsExpr.keyword

[← AsExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keyword: Token
```

获取或设置 AsExpr 节点中的 `as` 操作符。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `as` 操作符时，抛出异常。
