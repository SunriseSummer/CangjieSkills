<!-- cj-doc kind="api-member" level="6" id="std.ast.class.genericconstraint.prop-bitands" parent="std.ast.class.genericconstraint" -->
# GenericConstraint.bitAnds

[← GenericConstraint](index.md)

## 签名

```cangjie role=signature
public mut prop bitAnds: Tokens
```

获取或设置 GenericConstraint 节点中的 `&` 操作符的词法单元序列，可能为空。

## 契约

类型：Tokens

异常：

- ASTException - 当设置的 Tokens 不是 `&` 词法单元序列时，抛出异常。
