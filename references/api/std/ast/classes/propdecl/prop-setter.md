<!-- cj-doc kind="api-member" level="6" id="std.ast.class.propdecl.prop-setter" parent="std.ast.class.propdecl" -->
# PropDecl.setter

[← PropDecl](index.md)

## 签名

```cangjie role=signature
public mut prop setter: FuncDecl
```

获取或设置 PropDecl 节点的 setter 函数。

## 契约

类型：FuncDecl

异常：

- ASTException - 当 PropDecl 节点不存在 setter 函数时，抛出异常。
