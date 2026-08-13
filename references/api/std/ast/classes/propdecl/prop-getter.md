<!-- cj-doc kind="api-member" level="6" id="std.ast.class.propdecl.prop-getter" parent="std.ast.class.propdecl" -->
# PropDecl.getter

[← PropDecl](index.md)

## 签名

```cangjie role=signature
public mut prop getter: FuncDecl
```

获取或设置 PropDecl 节点的 getter 函数。

## 契约

类型：FuncDecl

异常：

- ASTException - 当 PropDecl 节点不存在 getter 函数时，抛出异常。
