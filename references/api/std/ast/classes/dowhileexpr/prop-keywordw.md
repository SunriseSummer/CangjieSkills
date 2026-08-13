<!-- cj-doc kind="api-member" level="6" id="std.ast.class.dowhileexpr.prop-keywordw" parent="std.ast.class.dowhileexpr" -->
# DoWhileExpr.keywordW

[← DoWhileExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordW: Token
```

获取或设置 DoWhileExpr 节点中 `while` 关键字，其中 keywordW 中的 W 为关键字 `while` 的首字母大写，代表关键字 `while` 。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `while` 关键字时，抛出异常。
