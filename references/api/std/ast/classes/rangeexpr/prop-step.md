<!-- cj-doc kind="api-member" level="6" id="std.ast.class.rangeexpr.prop-step" parent="std.ast.class.rangeexpr" -->
# RangeExpr.step

[← RangeExpr](index.md)

## 签名

```cangjie role=signature
public mut prop step: Expr
```

获取或设置 RangeExpr 中序列中前后两个元素之间的差值。

## 契约

类型：Expr

异常：

- ASTException - 当 RangeExpr 中未设置序列前后两个元素之间的差值时，抛出异常。
