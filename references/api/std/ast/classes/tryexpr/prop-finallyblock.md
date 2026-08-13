<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tryexpr.prop-finallyblock" parent="std.ast.class.tryexpr" -->
# TryExpr.finallyBlock

[← TryExpr](index.md)

## 签名

```cangjie role=signature
public mut prop finallyBlock: Block
```

获取或设置 TryExpr 中的关键字 `Finally` 块。

## 契约

类型：Block

异常：

- ASTException - 当 TryExpr 节点无 `Finally` 块节点时，抛出异常。
