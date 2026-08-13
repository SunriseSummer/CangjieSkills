<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.structtypeinfo.prop-constructors" parent="std.reflect.class.structtypeinfo" -->
# StructTypeInfo.constructors

[← StructTypeInfo](index.md)

## 签名

```cangjie role=signature
public prop constructors: Collection<ConstructorInfo>
```

获取该 StructTypeInfo 对应的 `struct` 的所有 `public` 构造函数信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 `struct` 类型无任何 `public` 构造函数，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<ConstructorInfo>
