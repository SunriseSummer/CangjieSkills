<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.getfunction" parent="std.reflect.class.packageinfo" -->
# PackageInfo.getFunction

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public func getFunction(name: String, parameterTypes: Array<TypeInfo>): GlobalFunctionInfo
```

尝试在该 PackageInfo 对应的包中获取拥有给定函数名称且与给定形参类型信息列表匹配的 `public` 全局函数的信息。

## 契约

参数：

- name: String - 全局函数的名称。
- parameterTypes: Array\<TypeInfo> - 形参类型信息列表。

返回值：

- GlobalFunctionInfo - 如果成功匹配则返回该全局定义的 `public` 类型的函数信息。

异常：

- InfoNotFoundException - 如果没找到对应全局定义的 `public` 全局函数，则抛出异常。
