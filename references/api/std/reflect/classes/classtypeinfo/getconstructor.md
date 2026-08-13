<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.getconstructor" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.getConstructor

[← ClassTypeInfo](index.md)

## 签名

```cangjie role=signature
public func getConstructor(parameterTypes: Array<TypeInfo>): ConstructorInfo
```

尝试在该 ClassTypeInfo 对应的 `class` 类型中获取与给定形参类型信息列表匹配的 `public` 构造函数的信息。

## 契约

参数：

- parameterTypes: Array\<TypeInfo> - 形参类型信息列表。

返回值：

- ConstructorInfo - 如果成功匹配则返回该 `public` 构造函数的信息。

异常：

- InfoNotFoundException - 如果没找到对应 `public` 构造函数，则抛出异常。
