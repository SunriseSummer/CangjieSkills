<!-- cj-doc kind="api-member" level="6" id="std.ast.class.decl.getattrs" parent="std.ast.class.decl" -->
# Decl.getAttrs

[← Decl](index.md)

## 签名

```cangjie role=signature
public func getAttrs(): Tokens
```

获取当前节点的属性（一般通过内置的 `Attribute` 来设置某个声明设置属性值）。

## 契约

返回值：

- Tokens - 当前节点的属性。
