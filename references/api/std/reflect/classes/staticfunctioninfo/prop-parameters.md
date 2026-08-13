<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticfunctioninfo.prop-parameters" parent="std.reflect.class.staticfunctioninfo" -->
# StaticFunctionInfo.parameters

[← StaticFunctionInfo](index.md)

## 签名

```cangjie role=signature
public prop parameters: ReadOnlyList<ParameterInfo>
```

获取该 StaticFunctionInfo 对应的静态成员函数的参数信息列表。

## 契约

> **注意：**
>
> 不保证参数顺序，可根据 `ParameterInfo`的 `index` 属性确定参数实际位置。

类型：ReadOnlyList\<ParameterInfo>
