<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.structtypeinfo.prop-instancevariables" parent="std.reflect.class.structtypeinfo" -->
# StructTypeInfo.instanceVariables

[← StructTypeInfo](index.md)

## 签名

```cangjie role=signature
public prop instanceVariables: Collection<InstanceVariableInfo>
```

获取该 StructTypeInfo 对应的 `struct` 的所有 `public` 实例成员变量信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 `struct` 类型无任何 `public` 实例成员变量，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<InstanceVariableInfo>
