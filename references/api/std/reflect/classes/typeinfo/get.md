<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.get" parent="std.reflect.class.typeinfo" -->
# TypeInfo.get

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public static func get(qualifiedName: String): TypeInfo
```

获取给定 `qualifiedName` 所对应的类型的 TypeInfo。

## 契约

> **注意：**
>
> 目前， 类型的限定名称 `qualifiedName` 不支持 `Nothing` 类型、函数类型、元组类型和`enum` 类型的限定名称。

参数：

- qualifiedName: String - 类型的限定名称。

返回值：

- TypeInfo - 类型的限定名称 `qualifiedName` 所对应的类型的类型信息。

异常：

- InfoNotFoundException - 如果无法获取与给定类型的限定名称 `qualifiedName` 匹配的类型所对应的类型信息，则抛出异常。
