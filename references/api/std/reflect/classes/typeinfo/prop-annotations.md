<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.prop-annotations" parent="std.reflect.class.typeinfo" -->
# TypeInfo.annotations

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public prop annotations: Collection<Annotation>
```

获取所有作用于该 TypeInfo 对应的类型的注解，返回对应集合。

## 契约

> **注意：**
>
> - 如果无任何注解作用于该类型信息所对应的类型，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<Annotation>
