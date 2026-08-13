<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.interfacetypeinfo.prop-sealedsubtypes" parent="std.reflect.class.interfacetypeinfo" -->
# InterfaceTypeInfo.sealedSubtypes

[← InterfaceTypeInfo](index.md)

## 签名

```cangjie role=signature
public prop sealedSubtypes: Collection<TypeInfo>
```

如果该 InterfaceTypeInfo 所对应的 `interface` 类型拥有 `sealed` 语义，则获取该 `interface` 类型所在包内的所有子类型的类型信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 `interface` 类型不拥有 `sealed` 语义，则返回空集合。
> - 如果该 `interface` 类型拥有 `sealed` 语义，那么获得的集合必不可能是空集合，因为该 `interface` 类型本身就是自己的子类型。

类型：Collection\<TypeInfo>
