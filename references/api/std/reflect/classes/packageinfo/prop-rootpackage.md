<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.prop-rootpackage" parent="std.reflect.class.packageinfo" -->
# PackageInfo.rootPackage

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public prop rootPackage: PackageInfo
```

获取该 PackageInfo 对应的 `root` 包的 PackageInfo。

## 契约

> **注意：**
>
> 如果包本身就是 `root` 包，那么其 `rootPackage` 属性返回的是其本身。例如，限定名称为 `a.b.c` 的包，`rootPackage` 返回的是 `a`; 限定名称为 `a` 的包，`rootpackage` 返回的是 `a`。

类型：PackageInfo

异常：

- InfoNotFoundException - 如果 `root` 包未被加载，则会抛出异常。
