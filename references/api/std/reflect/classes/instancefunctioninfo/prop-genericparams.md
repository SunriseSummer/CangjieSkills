<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancefunctioninfo.prop-genericparams" parent="std.reflect.class.instancefunctioninfo" -->
# InstanceFunctionInfo.genericParams

[← InstanceFunctionInfo](index.md)

## 签名

```cangjie role=signature
public prop genericParams: Collection<GenericTypeInfo>
```

获取该 InstanceFunctionInfo 对应的实例成员函数的泛型参数信息列表。

## 契约

类型：Collection\<GenericTypeInfo>

异常：

- InfoNotFoundException - GlobalFunctionInfo 没有泛型参数时抛出异常。
