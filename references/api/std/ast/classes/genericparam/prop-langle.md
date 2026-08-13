<!-- cj-doc kind="api-member" level="6" id="std.ast.class.genericparam.prop-langle" parent="std.ast.class.genericparam" -->
# GenericParam.lAngle

[← GenericParam](index.md)

## 签名

```cangjie role=signature
public mut prop lAngle: Token
```

获取或设置 GenericParam 节点中的左尖括号词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是左尖括号时，抛出异常。
