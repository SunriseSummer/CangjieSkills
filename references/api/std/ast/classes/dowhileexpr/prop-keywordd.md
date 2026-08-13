<!-- cj-doc kind="api-member" level="6" id="std.ast.class.dowhileexpr.prop-keywordd" parent="std.ast.class.dowhileexpr" -->
# DoWhileExpr.keywordD

[← DoWhileExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordD: Token
```

获取或设置 DoWhileExpr 节点中 `do` 关键字，其中 keywordD 中的 D 为关键字 `do` 的首字母大写，代表关键字 `do` 。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `do` 关键字时，抛出异常。
