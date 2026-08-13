<!-- cj-doc kind="api-member" level="6" id="std.ast.class.synchronizedexpr.prop-keyword" parent="std.ast.class.synchronizedexpr" -->
# SynchronizedExpr.keyword

[← SynchronizedExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keyword: Token
```

获取或设置 SynchronizedExpr 中的 `synchronized` 关键字。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `synchronized` 关键字时，抛出异常。
