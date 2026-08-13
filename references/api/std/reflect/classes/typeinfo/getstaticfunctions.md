<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.getstaticfunctions" parent="std.reflect.class.typeinfo" -->
# TypeInfo.getStaticFunctions

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public func getStaticFunctions(name: String): Array<StaticFunctionInfo>
```

给定函数名称，尝试获取该类型中所有匹配的静态成员函数的信息。

## 契约

参数：

- name: String - 函数名称。

返回值：

- Array\<StaticFunctionInfo> - 如果成功匹配则返回所有匹配到的静态成员函数信息。
