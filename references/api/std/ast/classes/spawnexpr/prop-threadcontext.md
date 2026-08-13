<!-- cj-doc kind="api-member" level="6" id="std.ast.class.spawnexpr.prop-threadcontext" parent="std.ast.class.spawnexpr" -->
# SpawnExpr.threadContext

[← SpawnExpr](index.md)

## 签名

```cangjie role=signature
public mut prop threadContext: Expr
```

获取或设置 SpawnExpr 中的线程上下文环境表达式。

## 契约

类型：Expr

异常：

- ASTException - 当 SpawnExpr 中不含有上下文表达式时，抛出异常。
