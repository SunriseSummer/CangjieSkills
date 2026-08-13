<!-- cj-doc kind="api-member" level="6" id="std.ast.class.importcontent.prop-lbrace" parent="std.ast.class.importcontent" -->
# ImportContent.lBrace

[← ImportContent](index.md)

## 签名

```cangjie role=signature
public mut prop lBrace: Token
```

获取或设置 ImportContent 节点中的 `{` 操作符词法单元，只有 `importKind` 为 `ImportKind.Multi` 时非空。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `{` 操作符时，抛出异常。
