<!-- cj-doc kind="api-member" level="6" id="std.ast.class.importcontent.prop-importalias" parent="std.ast.class.importcontent" -->
# ImportContent.importAlias

[← ImportContent](index.md)

## 签名

```cangjie role=signature
public mut prop importAlias: Tokens
```

获取或设置 ImportContent 节点中导入的定义或声明的别名词法单元序列，只有 `importKind` 为 `ImportKind.Alias` 时非空。

## 契约

功能：获取或设置 ImportContent 节点中导入的定义或声明的别名词法单元序列，只有 `importKind` 为 `ImportKind.Alias` 时非空。如：`import packageName.xxx as yyy` 中的 `as yyy`。

类型：Tokens
