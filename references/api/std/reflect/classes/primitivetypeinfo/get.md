<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.primitivetypeinfo.get" parent="std.reflect.class.primitivetypeinfo" -->
# PrimitiveTypeInfo.get

[← PrimitiveTypeInfo](index.md)

## 签名

```cangjie role=signature
public static redef func get(qualifiedName: String): PrimitiveTypeInfo
```

获取给定的类型的限定名称所对应类型的 PrimitiveTypeInfo。

## 契约

参数：

- qualifiedName: String - 类型的限定名称。

返回值：

- PrimitiveTypeInfo - 类型的限定名称 `qualifiedName` 所对应的类型的类型信息。

异常：

- InfoNotFoundException - 如果无法获取与给定类型的限定名称 `qualifiedName` 匹配的类型所对应的类型信息，则抛出异常。
- IllegalTypeException - 如果获取到的类型信息不是 PrimitiveTypeInfo， 则抛出异常。
