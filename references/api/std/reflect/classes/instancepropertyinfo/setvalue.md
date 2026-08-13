<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancepropertyinfo.setvalue" parent="std.reflect.class.instancepropertyinfo" -->
# InstancePropertyInfo.setValue

[← InstancePropertyInfo](index.md)

## 签名

```cangjie role=signature
public func setValue(instance: Any, newValue: Any): Unit
```

设置该 InstancePropertyInfo 对应的实例成员属性在给定实例中的值。

## 契约

参数：

- instance: Any - 实例。
- newValue: Any - 新值。

异常：

- IllegalSetException - 如果该实例成员属性信息所对应的实例成员属性不可修改，则抛出异常。
- IllegalTypeException - 如果实例 `instance` 的运行时类型与该实例成员属性信息所对应的实例成员属性所属的类型不严格相同，则抛出异常。
- IllegalTypeException - 如果新值 `newValue` 的运行时类型不是该实例成员属性信息所对应的实例成员属性的声明类型的子类型，则抛出异常。
