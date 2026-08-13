<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.structtypeinfo.prop-staticvariables" parent="std.reflect.class.structtypeinfo" -->
# StructTypeInfo.staticVariables

[← StructTypeInfo](index.md)

## 签名

```cangjie role=signature
public prop staticVariables: Collection<StaticVariableInfo>
```

获取该 StructTypeInfo 对应的 `struct` 的所有 `public` 静态成员变量信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 `struct` 类型无任何 `public` 静态成员变量，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<StaticVariableInfo>
