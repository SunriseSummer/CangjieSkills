<!-- cj-doc kind="api-member" level="6" id="std.ast.class.annotation.prop-condition" parent="std.ast.class.annotation" -->
# Annotation.condition

[← Annotation](index.md)

## 签名

```cangjie role=signature
public mut prop condition: Expr
```

获取或设置条件编译中的条件表达式，用于 `@When`，如 `@When[xxx]` 中的 `xxx`。

## 契约

类型：Expr

异常：

- ASTException - 当 Annotation 节点中没有条件表达式时，抛出异常。
