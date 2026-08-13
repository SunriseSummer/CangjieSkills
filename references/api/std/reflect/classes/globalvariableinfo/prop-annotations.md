<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.globalvariableinfo.prop-annotations" parent="std.reflect.class.globalvariableinfo" -->
# GlobalVariableInfo.annotations

[← GlobalVariableInfo](index.md)

## 签名

```cangjie role=signature
public prop annotations: Collection<Annotation>
```

获取所有作用于该 GlobalVariableInfo 对应的全局变量的注解，返回对应集合。

## 契约

> **注意：**
>
> - 如果无任何注解作用于该全局变量信息所对应的全局变量，则返回空集合。
> - 该集合不保证遍历顺序恒定。

类型：Collection\<Annotation>
