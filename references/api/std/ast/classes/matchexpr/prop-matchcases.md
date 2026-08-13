<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchexpr.prop-matchcases" parent="std.ast.class.matchexpr" -->
# MatchExpr.matchCases

[← MatchExpr](index.md)

## 签名

```cangjie role=signature
public mut prop matchCases: ArrayList<MatchCase>
```

获取或设置 MatchExpr 内的 `matchCase`, `matchCase` 以关键字 `case` 开头，后跟一个或者多个由 Pattern 或 Expr节点，具体见 MatchCase。

## 契约

类型：ArrayList\<MatchCase>
