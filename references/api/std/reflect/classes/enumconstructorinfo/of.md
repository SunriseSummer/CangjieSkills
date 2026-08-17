<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumconstructorinfo.of" parent="std.reflect.class.enumconstructorinfo" -->
# EnumConstructorInfo.of

[← EnumConstructorInfo](index.md)

## 签名

```cangjie role=signature
public static func of(instance: Any): EnumConstructorInfo
```

获取给定枚举实例所属的构造子信息。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 枚举实例。

## 返回值

- EnumConstructorInfo - `instance` 所属构造子信息。

## 异常

- IllegalTypeException - 如果 `instance` 不是该枚举的实例，则抛出异常。

