<!-- cj-doc kind="api-member" level="6" id="std.ast.class.resumeexpr.prop-keywordt" parent="std.ast.class.resumeexpr" -->
# ResumeExpr.keywordT

[← ResumeExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordT: Option<Token>
```

获取或设置 `throwing` 关键字的词法单元（如果存在）。

类型：Option<Token>

## 异常

- ASTException — 当提供的 Token 不是 `throwing` 关键字时抛出。

