<!-- cj-doc kind="api-member" level="6" id="std.ast.class.genericconstraint.prop-upperbound" parent="std.ast.class.genericconstraint" -->
# GenericConstraint.upperBound

[← GenericConstraint](index.md)

## 签名

```cangjie role=signature
public mut prop upperBound: Token
```

获取或设置 GenericConstraint 节点中的 `<:` 运算符。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `<:` 运算符时，抛出异常。
