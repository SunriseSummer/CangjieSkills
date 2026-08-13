<!-- cj-doc kind="api-member" level="6" id="std.ast.class.typealiasdecl.prop-assign" parent="std.ast.class.typealiasdecl" -->
# TypeAliasDecl.assign

[← TypeAliasDecl](index.md)

## 签名

```cangjie role=signature
public mut prop assign: Token
```

获取或设置标识符和 `type` 之间的 `=`。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `=` 时，抛出异常。
