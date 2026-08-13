<!-- cj-doc kind="api-member" level="6" id="std.ast.class.importcontent.prop-commas" parent="std.ast.class.importcontent" -->
# ImportContent.commas

[← ImportContent](index.md)

## 签名

```cangjie role=signature
public mut prop commas: Tokens
```

获取或设置 ImportContent 节点中的 "," 词法单元序列，只有 `importKind` 为 `ImportKind.Multi` 时非空。

## 契约

类型：Tokens

异常：

- ASTException - 当设置的 Tokens 不是 "," 词法单元序列时，抛出异常。
