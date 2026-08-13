<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.getstaticproperty" parent="std.reflect.class.typeinfo" -->
# TypeInfo.getStaticProperty

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public func getStaticProperty(name: String): StaticPropertyInfo
```

尝试获取该类型中与给定属性名称匹配的静态成员属性的信息。

## 契约

参数：

- name: String - 属性名称。

返回值：

- StaticPropertyInfo - 如果成功匹配则返回该静态成员属性的信息。

异常：

- InfoNotFoundException - 如果没找到对应 `public` 静态成员属性，则抛出异常。
