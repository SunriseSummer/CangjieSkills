<!-- cj-doc kind="api-member" level="6" id="std.ast.class.decl.prop-genericconstraint" parent="std.ast.class.decl" -->
# Decl.genericConstraint

[← Decl](index.md)

## 签名

```cangjie role=signature
public mut prop genericConstraint: ArrayList<GenericConstraint>
```

获取或设置声明节点的泛型约束，可能为空，如 `func foo<T>() where T <: Comparable<T> {}` 中的 `where T <: Comparable<T>`。

## 契约

类型：ArrayList\<GenericConstraint>
