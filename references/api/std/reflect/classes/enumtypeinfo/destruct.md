<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumtypeinfo.destruct" parent="std.reflect.class.enumtypeinfo" -->
# EnumTypeInfo.destruct

[← EnumTypeInfo](index.md)

## 签名

```cangjie role=signature
public func destruct(instance: Any): (EnumConstructorInfo, ReadOnlyList<Any>)
```

拆解给定枚举实例，返回其构造子信息和关联值列表。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 枚举实例。

## 返回值

- (EnumConstructorInfo, ReadOnlyList<Any>) - 构造子信息与关联值列表。

## 异常

- IllegalTypeException - 如果 `instance` 不是枚举类型实例，则抛出异常。

