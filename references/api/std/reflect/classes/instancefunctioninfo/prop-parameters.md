<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancefunctioninfo.prop-parameters" parent="std.reflect.class.instancefunctioninfo" -->
# InstanceFunctionInfo.parameters

[← InstanceFunctionInfo](index.md)

## 签名

```cangjie role=signature
public prop parameters: ReadOnlyList<ParameterInfo>
```

获取该 InstanceFunctionInfo 对应的实例成员函数的参数信息列表。

## 契约

> **说明：**
>
> 不保证参数顺序，可根据 `ParameterInfo`的 `index` 属性确定参数实际位置。

类型：ReadOnlyList\<ParameterInfo>
