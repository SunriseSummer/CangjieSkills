<!-- cj-doc kind="api-member" level="6" id="std.ast.class.isexpr.prop-keyword" parent="std.ast.class.isexpr" -->
# IsExpr.keyword

[← IsExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keyword: Token
```

获取或设置 IsExpr 节点中的 `is` 操作符。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `is` 操作符时，抛出异常。
