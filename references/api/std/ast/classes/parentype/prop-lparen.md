<!-- cj-doc kind="api-member" level="6" id="std.ast.class.parentype.prop-lparen" parent="std.ast.class.parentype" -->
# ParenType.lParen

[← ParenType](index.md)

## 签名

```cangjie role=signature
public mut prop lParen: Token
```

获取或设置 ParenType 节点中的 "(" 词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 "(" 时，抛出异常。
