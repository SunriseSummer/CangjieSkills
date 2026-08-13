<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.prop-qualifiedname" parent="std.reflect.class.typeinfo" -->
# TypeInfo.qualifiedName

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public prop qualifiedName: String
```

获取该 TypeInfo 对应的类型的限定名称。

## 契约

> **注意：**
>
> - 限定名称包含模块名和包名前缀。
> - 特别的，仓颉内置数据类型，以及位于 `std` 模块 `core` 包下的所有类型的限定名称都是不带有任何模块名和包名前缀的。
> - 在缺省模块名和包名的上下文中定义的所有类型，均无模块名前缀，但拥有包名前缀"`default`"，如："`default.MyType`"。

类型：String
