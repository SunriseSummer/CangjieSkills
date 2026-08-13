<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.prop-name" parent="std.reflect.class.packageinfo" -->
# PackageInfo.name

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public prop name: String
```

获取该包信息所对应的包的名称。

## 契约

> **注意：**
>
> 包的名称不包含其所在的模块名称和其父包的名称，例如限定名称为 `a/b.c.d` 的包的名称是 `d` 。

类型：String
