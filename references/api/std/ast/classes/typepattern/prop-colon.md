<!-- cj-doc kind="api-member" level="6" id="std.ast.class.typepattern.prop-colon" parent="std.ast.class.typepattern" -->
# TypePattern.colon

[← TypePattern](index.md)

## 签名

```cangjie role=signature
public mut prop colon: Token
```

获取或设置 TypePattern 节点中的 ":" 操作符的词法单元节点。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 ":" 操作符时，抛出异常。
