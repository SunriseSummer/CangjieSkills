<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.getstaticvariable" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.getStaticVariable

[← ClassTypeInfo](index.md)

## 签名

```cangjie role=signature
public func getStaticVariable(name: String): StaticVariableInfo
```

给定变量名称，尝试获取该 ClassTypeInfo 所对应的 `class` 类型中匹配的静态成员变量的信息。

## 契约

参数：

- name: String - 变量名称。

返回值：

- StaticVariableInfo - 如果成功匹配则返回该静态成员变量的信息。

异常：

- InfoNotFoundException - 如果没找到对应静态成员变量，则抛出异常。
