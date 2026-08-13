<!-- cj-doc kind="api-member" level="6" id="std.ast.class.ifexpr.prop-keywordi" parent="std.ast.class.ifexpr" -->
# IfExpr.keywordI

[← IfExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordI: Token
```

获取或设置 IfExpr 节点中的 `if` 关键字。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `if` 关键字时，抛出异常。
