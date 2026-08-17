<!-- cj-doc kind="api-member" level="6" id="std.ast.class.packageheader.prop-orgname" parent="std.ast.class.packageheader" -->
# PackageHeader.orgName

[← PackageHeader](index.md)

## 签名

```cangjie role=signature
public mut prop orgName: Token
```

获取或设置 PackageHeader 节点中代表组织名的词法单元，setter 会检查 orgSeparator 是否为 "::" 词法单元，若为空则同时设置其为 "::" 词法单元。

类型：Token

## 异常

- ASTException - 当设置的 Token 内容为空字符串时抛出异常。

