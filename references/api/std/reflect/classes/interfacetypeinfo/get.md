<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.interfacetypeinfo.get" parent="std.reflect.class.interfacetypeinfo" -->
# InterfaceTypeInfo.get

[← InterfaceTypeInfo](index.md)

## 签名

```cangjie role=signature
public redef static func get(qualifiedName: String): InterfaceTypeInfo
```

获取给定 `qualifiedName` 所对应的类型的 InterfaceTypeInfo。

## 契约

参数：

- qualifiedName: String - 类型的限定名称。

返回值：

- InterfaceTypeInfo - 类型的限定名称 `qualifiedName` 所对应的 `Interface` 类型的类型信息。

异常：

- InfoNotFoundException - 如果无法获取与给定类型的限定名称 `qualifiedName` 匹配的类型所对应的类型信息，则抛出异常。
- IllegalTypeException - 如果获取到的类型信息不是 InterfaceTypeInfo， 则抛出异常。
