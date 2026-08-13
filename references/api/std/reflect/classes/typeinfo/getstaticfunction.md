<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.getstaticfunction" parent="std.reflect.class.typeinfo" -->
# TypeInfo.getStaticFunction

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public func getStaticFunction(name: String, parameterTypes: Array<TypeInfo>): StaticFunctionInfo
```

通过给定函数名称与函数形参类型列表所对应的类型信息列表，尝试获取该类型中匹配的静态成员函数的信息。

## 契约

参数：

- name: String - 函数名称。
- parameterTypes: Array\<TypeInfo> - 函数形参类型列表所对应的类型信息列表。

返回值：

- StaticFunctionInfo - 如果成功匹配则返回该静态成员函数的信息。

异常：

- InfoNotFoundException - 如果没找到对应 `public` 静态成员函数，则抛出异常。
