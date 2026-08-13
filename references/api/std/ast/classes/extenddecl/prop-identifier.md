<!-- cj-doc kind="api-member" level="6" id="std.ast.class.extenddecl.prop-identifier" parent="std.ast.class.extenddecl" -->
# ExtendDecl.identifier

[← ExtendDecl](index.md)

## 签名

```cangjie role=signature
public mut override prop identifier: Token
```

ExtendDecl 节点继承 Decl 节点，但是不支持 `identifier` 属性，使用时会抛出异常。

## 契约

类型：Token

异常：

- ASTException - 当使用 `identifier` 属性时，抛出异常。
