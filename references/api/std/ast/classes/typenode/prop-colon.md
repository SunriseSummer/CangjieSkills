<!-- cj-doc kind="api-member" level="6" id="std.ast.class.typenode.prop-colon" parent="std.ast.class.typenode" -->
# TypeNode.colon

[← TypeNode](index.md)

## 签名

```cangjie role=signature
public mut prop colon: Token
```

获取或设置 TypeNode 节点中的操作符 ":"，可能为 ILLEGAL 的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 ":" 操作符时，抛出异常。
