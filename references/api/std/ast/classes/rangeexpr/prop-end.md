<!-- cj-doc kind="api-member" level="6" id="std.ast.class.rangeexpr.prop-end" parent="std.ast.class.rangeexpr" -->
# RangeExpr.end

[← RangeExpr](index.md)

## 签名

```cangjie role=signature
public mut prop end: Expr
```

获取或设置 RangeExpr 中的终止值。

## 契约

类型：Expr

异常：

- ASTException - 终止表达式省略。只有在 Range\<Int64> 类型的实例用在下标操作符 `[]` 为空的场景。
