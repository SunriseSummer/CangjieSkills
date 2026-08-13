<!-- cj-doc kind="api-member" level="6" id="std.ast.class.vardecl.prop-decltype" parent="std.ast.class.vardecl" -->
# VarDecl.declType

[← VarDecl](index.md)

## 签名

```cangjie role=signature
public mut prop declType: TypeNode
```

获取或设置 VarDecl 节点的变量类型。

## 契约

类型：TypeNode

异常：

- ASTException - 当 VarDecl 节点没有声明变量类型时，抛出异常。
