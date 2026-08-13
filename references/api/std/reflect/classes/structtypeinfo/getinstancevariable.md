<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.structtypeinfo.getinstancevariable" parent="std.reflect.class.structtypeinfo" -->
# StructTypeInfo.getInstanceVariable

[← StructTypeInfo](index.md)

## 签名

```cangjie role=signature
public func getInstanceVariable(name: String): InstanceVariableInfo
```

给定变量名称，尝试获取该 StructTypeInfo 对应的 `struct` 类型中匹配的实例成员变量的信息。

## 契约

参数：

- name: String - 变量名称。

返回值：

- InstanceVariableInfo - 如果成功匹配则返回该实例成员变量的信息。

异常：

- InfoNotFoundException - 如果没找到对应 `public` 实例成员变量，则抛出异常。
