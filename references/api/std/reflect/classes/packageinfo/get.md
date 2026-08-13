<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.get" parent="std.reflect.class.packageinfo" -->
# PackageInfo.get

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public static func get(qualifiedName: String): PackageInfo
```

获取给定 `qualifiedName` 所对应的 PackageInfo。

## 契约

参数：

- qualifiedName: String - 类型的限定名称。

返回值：

- PackageInfo - 类型的限定名称 `qualifiedName` 所对应的包信息。

异常：

- InfoNotFoundException - 如果无法获取与给定类型的限定名称 `qualifiedName` 所对应的类型信息，则抛出异常。
