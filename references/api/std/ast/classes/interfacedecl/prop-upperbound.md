<!-- cj-doc kind="api-member" level="6" id="std.ast.class.interfacedecl.prop-upperbound" parent="std.ast.class.interfacedecl" -->
# InterfaceDecl.upperBound

[← InterfaceDecl](index.md)

## 签名

```cangjie role=signature
public mut prop upperBound: Token
```

获取或设置 `<:` 操作符。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `<:` 操作符时，抛出异常。
