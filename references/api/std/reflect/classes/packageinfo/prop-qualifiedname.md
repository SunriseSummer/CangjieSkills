<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.prop-qualifiedname" parent="std.reflect.class.packageinfo" -->
# PackageInfo.qualifiedName

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public prop qualifiedName: String
```

获取该 PackageInfo 对应的包的限定名称。

## 契约

> **注意：**
>
> 包的限定名称的格式是 `(module_name/)?(default|package_name)(.package_name)*`，例如限定名称为 `a/b.c.d` 的包位于模块 `a` 下的 `b` 包里的 `c` 包里。

类型：String
