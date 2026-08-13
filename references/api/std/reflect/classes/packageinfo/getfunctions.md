<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.getfunctions" parent="std.reflect.class.packageinfo" -->
# PackageInfo.getFunctions

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public func getFunctions(name: String): Array<GlobalFunctionInfo>
```

尝试在该 PackageInfo 对应的包中获取拥有给定函数名称的所有 `public` 全局函数的信息。

## 契约

参数：

- name: String - 全局函数的名称。

返回值：

- Array\<GlobalFunctionInfo> - 拥有给定函数名称的所有 `public` 全局函数的信息数组。
