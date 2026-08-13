<!-- cj-doc kind="api-member" level="6" id="std.ast.class.packageheader.prop-keywordm" parent="std.ast.class.packageheader" -->
# PackageHeader.keywordM

[← PackageHeader](index.md)

## 签名

```cangjie role=signature
public mut prop keywordM: Token
```

获取或设置 PackageHeader 节点中的 `macro` 关键字的词法单元（`M` 为关键字首字母，下同），可能为 ILLEGAL 的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `macro` 关键字时，抛出异常。
