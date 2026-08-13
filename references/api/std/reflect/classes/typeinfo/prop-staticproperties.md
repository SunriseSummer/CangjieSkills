<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.prop-staticproperties" parent="std.reflect.class.typeinfo" -->
# TypeInfo.staticProperties

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public prop staticProperties: Collection<StaticPropertyInfo>
```

获取该 TypeInfo 对应类型的所有 `public` 静态成员属性信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 TypeInfo 对应的类型无任何 `public` 静态成员属性，则返回空集合。
> - 该集合不保证遍历顺序恒定。
> - 如果该类型信息所对应的类型是 `struct` 、`class` 或 `interface` 类型，则该集合不包含继承而来的静态成员属性的信息。

类型：Collection\<StaticPropertyInfo>
