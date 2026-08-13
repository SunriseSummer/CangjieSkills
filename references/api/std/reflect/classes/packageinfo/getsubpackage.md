<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.getsubpackage" parent="std.reflect.class.packageinfo" -->
# PackageInfo.getSubPackage

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public func getSubPackage(qualifiedName: String): PackageInfo
```

尝试获取该 PackageInfo 对应限定名称为 `qualifiedName` 的子包的信息。

## 契约

参数：

- qualifiedName: String - 子包的限定名称。

返回值：

- PackageInfo - 该子包的包信息。

异常：

- InfoNotFoundException - 如果该子包不存在或者未加载，则会抛出异常。
- IllegalArgumentException - 如果 `qualifiedName` 不符合规范，则抛出异常。
