<!-- cj-doc kind="api-member" level="6" id="std.ast.class.assignexpr.prop-assign" parent="std.ast.class.assignexpr" -->
# AssignExpr.assign

[← AssignExpr](index.md)

## 签名

```cangjie role=signature
public mut prop assign: Token
```

获取或设置 AssignExpr 节点中的赋值操作符（如 `=` 等）。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是赋值操作符时，抛出异常。
