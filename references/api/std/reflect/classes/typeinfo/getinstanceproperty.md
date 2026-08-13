<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.getinstanceproperty" parent="std.reflect.class.typeinfo" -->
# TypeInfo.getInstanceProperty

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public func getInstanceProperty(name: String): InstancePropertyInfo
```

尝试获取该类型中与给定属性名称匹配的实例成员属性的信息。

## 契约

参数：

- name: String - 属性名称。

返回值：

- InstancePropertyInfo - 如果成功匹配则返回该实例成员属性的信息。

异常：

- InfoNotFoundException - 如果没找到对应 `public` 实例成员属性，则抛出异常。
