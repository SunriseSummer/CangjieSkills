<!-- cj-doc kind="api-member" level="6" id="std.ast.class.annotation.prop-at" parent="std.ast.class.annotation" -->
# Annotation.at

[← Annotation](index.md)

## 签名

```cangjie role=signature
public mut prop at: Token
```

获取或设置 Annotation 节点中的 `@` 操作符或 `@!` 操作符。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `@` 操作符或 `@!` 操作符时，抛出异常。
