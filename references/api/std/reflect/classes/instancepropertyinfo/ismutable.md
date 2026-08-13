<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancepropertyinfo.ismutable" parent="std.reflect.class.instancepropertyinfo" -->
# InstancePropertyInfo.isMutable

[← InstancePropertyInfo](index.md)

## 签名

```cangjie role=signature
public func isMutable(): Bool
```

判断该 InstancePropertyInfo 对应的实例成员属性是否可修改。

## 契约

> **注意：**
>
> 如果实例成员属性被 `mut` 修饰符所修饰，则该实例成员属性可被修改，否则不可被修改。

返回值：

- Bool - 如果该实例成员属性信息所对应的实例成员属性可被修改则返回 `true` ，否则返回 `false`。
