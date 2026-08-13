<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.parameterinfo.prop-annotations" parent="std.reflect.class.parameterinfo" -->
# ParameterInfo.annotations

[← ParameterInfo](index.md)

## 签名

```cangjie role=signature
public prop annotations: Collection<Annotation>
```

获取所有作用于该 ParameterInfo 对应的函数形参的注解，返回对应集合。

## 契约

> **注意：**
>
> - 如果无任何注解作用于该函数形参信息所对应的函数形参，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<Annotation>
