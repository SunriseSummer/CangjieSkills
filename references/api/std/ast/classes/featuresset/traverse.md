<!-- cj-doc kind="api-member" level="6" id="std.ast.class.featuresset.traverse" parent="std.ast.class.featuresset" -->
# FeaturesSet.traverse

[← FeaturesSet](index.md)

## 签名

```cangjie role=signature
public func traverse(v: Visitor): Unit
```

遍历当前语法树节点及其子节点。要提前终止子节点遍历，请重写 `visit` 函数并调用 `breakTraverse` 函数来终止遍历行为。参见 自定义访问函数遍历 AST 对象。

## 参数

- v: Visitor - 一个 Visitor 类型实例。

