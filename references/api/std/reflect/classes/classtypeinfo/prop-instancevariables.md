<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.prop-instancevariables" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.instanceVariables

[← ClassTypeInfo](index.md)

## 签名

```cangjie role=signature
public prop instanceVariables: Collection<InstanceVariableInfo>
```

获取该 ClassTypeInfo 对应的 `class` 的所有 `public` 实例成员变量信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该 `class` 类型无任何 `public` 实例成员变量，则返回空集合。
> - 该集合不保证遍历顺序恒定。
> - 该集合不包含任何继承而来的 `public` 实例成员变量。

类型：Collection\<InstanceVariableInfo>
