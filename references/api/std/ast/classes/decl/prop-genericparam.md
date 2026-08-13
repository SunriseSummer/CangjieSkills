<!-- cj-doc kind="api-member" level="6" id="std.ast.class.decl.prop-genericparam" parent="std.ast.class.decl" -->
# Decl.genericParam

[← Decl](index.md)

## 签名

```cangjie role=signature
public mut prop genericParam: GenericParam
```

获取或设置形参列表，类型形参列表由 `<>` 括起，多个类型形参之间用逗号分隔。

## 契约

类型：GenericParam

异常：

- ASTException - 当节点未定义类型形参列表时，抛出异常。
