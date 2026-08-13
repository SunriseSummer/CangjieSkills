<!-- cj-doc kind="api-member" level="6" id="std.ast.class.genericparam.prop-rangle" parent="std.ast.class.genericparam" -->
# GenericParam.rAngle

[← GenericParam](index.md)

## 签名

```cangjie role=signature
public mut prop rAngle: Token
```

获取或设置 GenericParam 节点中的右尖括号词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是右尖括号时，抛出异常。
