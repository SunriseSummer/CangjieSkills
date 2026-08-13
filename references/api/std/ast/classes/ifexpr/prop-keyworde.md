<!-- cj-doc kind="api-member" level="6" id="std.ast.class.ifexpr.prop-keyworde" parent="std.ast.class.ifexpr" -->
# IfExpr.keywordE

[← IfExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordE: Token
```

获取或设置 IfExpr 节点中 `else` 关键字。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `else` 关键字时，抛出异常。
