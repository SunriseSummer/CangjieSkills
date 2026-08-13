<!-- cj-doc kind="api-member" level="6" id="std.ast.class.decl.hasattr" parent="std.ast.class.decl" -->
# Decl.hasAttr

[← Decl](index.md)

## 签名

```cangjie role=signature
public func hasAttr(attr: String): Bool
```

判断当前节点是否具有某个属性（一般通过内置的 `Attribute` 来设置某个声明的属性值）。

## 契约

参数：

- attr: String - 将要判断是否存在于该节点的属性。

返回值：

- Bool - 当前节点具有该属性时，返回 true；反之，返回 false。
