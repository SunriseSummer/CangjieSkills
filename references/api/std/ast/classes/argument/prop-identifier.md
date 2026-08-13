<!-- cj-doc kind="api-member" level="6" id="std.ast.class.argument.prop-identifier" parent="std.ast.class.argument" -->
# Argument.identifier

[← Argument](index.md)

## 签名

```cangjie role=signature
public mut prop identifier: Token
```

获取或设置 Argument 节点中的标识符，如 `arg:value` 中的 `arg`，可能为 ILLEGAL 的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当获取和设置的 Token 类型不是 IDENTIFIER 标识符或 Token 的字面量值是空时，抛出异常。
