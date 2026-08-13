<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.gettypeinfo" parent="std.reflect.class.packageinfo" -->
# PackageInfo.getTypeInfo

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public func getTypeInfo(qualifiedTypeName: String): TypeInfo
```

尝试在该 PackageInfo 对应的包中获取拥有给定类型名称的全局定义的 `public` 类型的类型信息。

## 契约

参数：

- qualifiedTypeName: String - 类型的限定名称

返回值：

- TypeInfo - 如果成功匹配则返回该全局定义的 `public` 类型的类型信息。

异常：

- InfoNotFoundException - 如果没找到对应全局定义的 `public` 类型，则抛出异常。
