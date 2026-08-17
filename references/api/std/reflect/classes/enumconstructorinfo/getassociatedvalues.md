<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumconstructorinfo.getassociatedvalues" parent="std.reflect.class.enumconstructorinfo" -->
# EnumConstructorInfo.getAssociatedValues

[← EnumConstructorInfo](index.md)

## 签名

```cangjie role=signature
public func getAssociatedValues(instance: Any): ReadOnlyList<Any>
```

获取给定枚举实例的关联值列表。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 枚举实例。

## 返回值

- ReadOnlyList<Any> - 关联值列表，按声明顺序返回。

## 异常

- IllegalTypeException - 如果 `instance` 不是通过该构造子与创建的，则抛出异常。

