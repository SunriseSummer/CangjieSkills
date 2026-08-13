<!-- cj-doc kind="api-member" level="6" id="std.ast.class.constructor.prop-rparen" parent="std.ast.class.constructor" -->
# Constructor.rParen

[← Constructor](index.md)

## 签名

```cangjie role=signature
public mut prop rParen: Token
```

获取或设置 Constructor 节点中的 ")" 词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 ")" 时，抛出异常。
