<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.prop-instanceproperties" parent="std.reflect.class.typeinfo" -->
# TypeInfo.instanceProperties

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public prop instanceProperties: Collection<InstancePropertyInfo>
```

获取该 TypeInfo 对应类型的所有 `public` 实例成员属性信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 TypeInfo 对应的类型无任何 `public` 实例成员属性，则返回空集合。
> - 该集合不保证遍历顺序恒定。
> - 如果该类型信息所对应的类型是 `struct` 或 `class` 类型，则该集合不包含继承而来的实例成员属性的信息。

类型：Collection\<InstancePropertyInfo>
