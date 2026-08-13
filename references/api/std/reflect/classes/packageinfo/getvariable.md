<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.getvariable" parent="std.reflect.class.packageinfo" -->
# PackageInfo.getVariable

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public func getVariable(name: String): GlobalVariableInfo
```

尝试在该 PackageInfo 对应的包中获取拥有给定变量名称的 `public` 全局变量的信息。

## 契约

参数：

- name: String - 全局变量的名称。

返回值：

- GlobalVariableInfo - 如果成功匹配则返回该全局定义的 `public` 类型的变量信息。

异常：

- InfoNotFoundException - 如果没找到对应全局定义的 `public` 全局变量，则抛出异常。
