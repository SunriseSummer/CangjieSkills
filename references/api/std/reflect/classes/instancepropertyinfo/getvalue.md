<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancepropertyinfo.getvalue" parent="std.reflect.class.instancepropertyinfo" -->
# InstancePropertyInfo.getValue

[← InstancePropertyInfo](index.md)

## 签名

```cangjie role=signature
public func getValue(instance: Any): Any
```

获取该 InstancePropertyInfo 对应的实例成员属性在给定实例中的值。

## 契约

参数：

- instance: Any - 实例。

返回值：

- Any - 该实例成员属性在实例 `instance` 中的值。

异常：

- IllegalTypeException - 如果实例 `instance` 的运行时类型与该实例成员属性信息所对应的实例成员属性所属的类型不严格相同，则抛出异常。
