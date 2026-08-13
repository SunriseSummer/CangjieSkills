<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.constructorinfo.prop-annotations" parent="std.reflect.class.constructorinfo" -->
# ConstructorInfo.annotations

[← ConstructorInfo](index.md)

## 签名

```cangjie role=signature
public prop annotations: Collection<Annotation>
```

获取所有作用于该 ConstructorInfo 对应的构造函数的注解，返回对应集合。

## 契约

> **注意：**
>
> - 如果无任何注解作用于该构造函数信息所对应的构造函数，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<Annotation>
