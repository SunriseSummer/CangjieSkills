<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.prop-subpackages" parent="std.reflect.class.packageinfo" -->
# PackageInfo.subPackages

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public prop subPackages: Collection<PackageInfo>
```

获取该 PackageInfo 对应的所有子包的 PackageInfo 集合。

## 契约

> **注意：**
>
> - 该属性只会返回已被加载的子包。
> - 不保证返回结果的顺序。

类型：Collection\<PackageInfo>
