<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticpropertyinfo.prop-annotations" parent="std.reflect.class.staticpropertyinfo" -->
# StaticPropertyInfo.annotations

[← StaticPropertyInfo](index.md)

## 签名

```cangjie role=signature
public prop annotations: Collection<Annotation>
```

获取所有作用于该 StaticPropertyInfo 所对应的静态成员属性的注解所组成的集合。

## 契约

> **注意：**
>
> - 如果无任何注解作用于该静态成员属性信息所对应的静态成员属性，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<Annotation>
