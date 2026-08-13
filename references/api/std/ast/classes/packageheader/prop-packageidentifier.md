<!-- cj-doc kind="api-member" level="6" id="std.ast.class.packageheader.prop-packageidentifier" parent="std.ast.class.packageheader" -->
# PackageHeader.packageIdentifier

[← PackageHeader](index.md)

## 签名

```cangjie role=signature
public mut prop packageIdentifier: Token
```

获取或设置 PackageHeader 节点中当前包的名字，如果当前包为 root 包，即为完整包名，若当前包为子包，则为最后一个 "." 后的名字。

## 契约

类型：Token
