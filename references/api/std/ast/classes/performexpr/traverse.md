<!-- cj-doc kind="api-member" level="6" id="std.ast.class.performexpr.traverse" parent="std.ast.class.performexpr" -->
# PerformExpr.traverse

[← PerformExpr](index.md)

## 签名

```cangjie role=signature
public func traverse(v: Visitor): Unit
```

遍历当前语法树节点及其子节点。若要提前终止子节点遍历，可重写 `visit` 函数并调用 `breakTraverse` 函数。请参见自定义访问函数遍历 AST 对象示例。

## 参数

- v: Visitor - Visitor 类型的实例。

