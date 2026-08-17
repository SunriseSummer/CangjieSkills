<!-- cj-doc kind="api-member" level="6" id="std.ast.class.packageheader.prop-orgseparator" parent="std.ast.class.packageheader" -->
# PackageHeader.orgSeparator

[← PackageHeader](index.md)

## 签名

```cangjie role=signature
public mut prop orgSeparator: Token
```

获取或设置 PackageHeader 节点中的 "::" 词法单元，setter 会检查 orgName 内容是否为空字符串，若有则抛异常。

类型：Token

## 异常

- ASTException - 当设置的 Token 不是 "::" 时，或 orgName 内容为空字符串时抛出异常。

