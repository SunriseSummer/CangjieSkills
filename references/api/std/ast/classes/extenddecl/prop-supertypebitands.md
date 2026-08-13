<!-- cj-doc kind="api-member" level="6" id="std.ast.class.extenddecl.prop-supertypebitands" parent="std.ast.class.extenddecl" -->
# ExtendDecl.superTypeBitAnds

[← ExtendDecl](index.md)

## 签名

```cangjie role=signature
public mut prop superTypeBitAnds: Tokens
```

获取或设置 ExtendDecl 节点的父接口声明中的 `&` 操作符的词法单元序列，可能为空。

## 契约

类型：Tokens

异常：

- ASTException - 当设置的 Tokens 不是 `&` 词法单元序列时，抛出异常。
