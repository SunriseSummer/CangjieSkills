<!-- cj-doc kind="api-member" level="6" id="std.ast.class.vardecl.prop-assign" parent="std.ast.class.vardecl" -->
# VarDecl.assign

[← VarDecl](index.md)

## 签名

```cangjie role=signature
public mut prop assign: Token
```

获取或设置 VarDecl 节点中的赋值操作符的位置信息。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是赋值操作符时，抛出异常。
