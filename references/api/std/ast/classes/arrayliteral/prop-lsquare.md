<!-- cj-doc kind="api-member" level="6" id="std.ast.class.arrayliteral.prop-lsquare" parent="std.ast.class.arrayliteral" -->
# ArrayLiteral.lSquare

[← ArrayLiteral](index.md)

## 签名

```cangjie role=signature
public mut prop lSquare: Token
```

获取或设置 ArrayLiteral 中的 "["。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 "[" 时，抛出异常。
