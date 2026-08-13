<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.prop-name" parent="std.reflect.class.typeinfo" -->
# TypeInfo.name

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public prop name: String
```

获取该 TypeInfo 对应的类型的名称。

## 契约

> **注意：**
>
> - 该名称不包含任何模块名和包名前缀。
> - 类型别名的类型信息就是实际类型其本身的类型信息，所以该函数并不会返回类型别名本身的名称而是实际类型的名称，如类型别名 Byte 的类型信息的名称是 UInt8 而不是 Byte。

类型：String
