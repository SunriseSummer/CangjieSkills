<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.prop-sealedsubclasses" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.sealedSubclasses

[← ClassTypeInfo](index.md)

## 签名

```cangjie role=signature
public prop sealedSubclasses: Collection<ClassTypeInfo>
```

如果该 ClassTypeInfo 对应的 `class` 类型拥有 `sealed` 语义，则获取该 `class` 类型所在包内的所有子类的类型信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 `class` 类型不拥有 `sealed` 语义，则返回空集合。
> - 如果该 `class` 类型拥有 `sealed` 语义，那么获得的集合必不可能是空集合，因为该 `class` 类型本身就是自己的子类。

类型：Collection\<ClassTypeInfo>
