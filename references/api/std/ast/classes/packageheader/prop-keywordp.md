<!-- cj-doc kind="api-member" level="6" id="std.ast.class.packageheader.prop-keywordp" parent="std.ast.class.packageheader" -->
# PackageHeader.keywordP

[← PackageHeader](index.md)

## 签名

```cangjie role=signature
public mut prop keywordP: Token
```

获取或设置 PackageHeader 节点中的 `package` 关键字的词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `package` 关键字时，抛出异常。
