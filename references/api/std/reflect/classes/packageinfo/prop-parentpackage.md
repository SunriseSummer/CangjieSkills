<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.prop-parentpackage" parent="std.reflect.class.packageinfo" -->
# PackageInfo.parentPackage

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public prop parentPackage: PackageInfo
```

获取该 PackageInfo 对应的父包的 PackageInfo。

## 契约

类型：PackageInfo

异常：

- InfoNotFoundException - 如果父包未被加载，则会抛出异常。
