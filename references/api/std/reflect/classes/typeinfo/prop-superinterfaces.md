<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.prop-superinterfaces" parent="std.reflect.class.typeinfo" -->
# TypeInfo.superInterfaces

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public prop superInterfaces: Collection<InterfaceTypeInfo>
```

获取该 TypeInfo 对应的类型直接实现的所有 `interface` 类型的信息，返回对应集合。

## 契约

> **注意：**
>
> - 所有类型均默认直接实现 interface Any 类型。
> - 该集合不保证遍历顺序恒定。
> - 目前， `struct` 类型只支持获取到 interface Any 类型。

类型：Collection\<InterfaceTypeInfo>
