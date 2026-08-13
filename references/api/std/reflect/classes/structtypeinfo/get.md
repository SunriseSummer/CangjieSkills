<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.structtypeinfo.get" parent="std.reflect.class.structtypeinfo" -->
# StructTypeInfo.get

[← StructTypeInfo](index.md)

## 签名

```cangjie role=signature
public static redef func get(qualifiedName: String): StructTypeInfo
```

获取给定 `qualifiedName` 所对应的类型的 StructTypeInfo。

## 契约

参数：

- qualifiedName: String - 类型的限定名称。

返回值：

- StructTypeInfo - 类型的限定名称 `qualifiedName` 所对应的 `Struct` 类型的类型信息。

异常：

- InfoNotFoundException - 如果无法获取与给定类型的限定名称 `qualifiedName` 匹配的类型所对应的类型信息，则抛出异常。
- IllegalTypeException - 如果获取到的类型信息不是 StructTypeInfo， 则抛出异常。
