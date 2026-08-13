<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.getinstancefunction" parent="std.reflect.class.typeinfo" -->
# TypeInfo.getInstanceFunction

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public func getInstanceFunction(name: String, parameterTypes: Array<TypeInfo>): InstanceFunctionInfo
```

给定函数名称与函数形参类型列表所对应的类型信息列表，尝试获取该类型中匹配的实例成员函数的信息。

## 契约

参数：

- name: String - 函数名称。
- parameterTypes: Array\<TypeInfo> - 函数形参类型列表所对应的类型信息列表。

返回值：

- InstanceFunctionInfo - 如果成功匹配则返回该实例成员函数的信息。

异常：

- InfoNotFoundException - 如果没找到对应 `public` 实例成员函数，则抛出异常。
