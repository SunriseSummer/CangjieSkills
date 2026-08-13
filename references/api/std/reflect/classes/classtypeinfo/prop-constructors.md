<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.prop-constructors" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.constructors

[← ClassTypeInfo](index.md)

## 签名

```cangjie role=signature
public prop constructors: Collection<ConstructorInfo>
```

获取该 ClassTypeInfo 对应的 `class` 的所有 `public` 构造函数信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 `class` 类型无任何 `public` 构造函数，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<ConstructorInfo>
