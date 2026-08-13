<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.constructorinfo.prop-parameters" parent="std.reflect.class.constructorinfo" -->
# ConstructorInfo.parameters

[← ConstructorInfo](index.md)

## 签名

```cangjie role=signature
public prop parameters: ReadOnlyList<ParameterInfo>
```

获取该 ConstructorInfo 所对应的构造函数的参数类型列表。

## 契约

> **注意：**
>
> 不保证参数顺序，可根据 `ParameterInfo`的 `index` 属性确定参数实际位置。

类型：ReadOnlyList\<ParameterInfo>
