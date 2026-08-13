<!-- cj-doc kind="api-member" level="6" id="std.ast.class.maindecl.prop-decltype" parent="std.ast.class.maindecl" -->
# MainDecl.declType

[← MainDecl](index.md)

## 签名

```cangjie role=signature
public mut prop declType: TypeNode
```

获取或设置 MainDecl 节点的函数返回类型。

## 契约

类型：TypeNode

异常：

- ASTException - 当 MainDecl 节点的函数返回类型是一个缺省值时，抛出异常。
