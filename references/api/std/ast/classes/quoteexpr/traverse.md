<!-- cj-doc kind="api-member" level="6" id="std.ast.class.quoteexpr.traverse" parent="std.ast.class.quoteexpr" -->
# QuoteExpr.traverse

[← QuoteExpr](index.md)

## 签名

```cangjie role=signature
public func traverse(v: Visitor): Unit
```

遍历当前语法树节点及其子节点。

## 契约

功能：遍历当前语法树节点及其子节点。若提前终止遍历子节点的行为，可重写 `visit` 函数并调用 `breakTraverse` 函数提前终止遍历行为，请参见自定义访问函数遍历 AST 对象示例。

参数：

- v: Visitor - Visitor 类型的实例。
