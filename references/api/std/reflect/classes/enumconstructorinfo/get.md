<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumconstructorinfo.get" parent="std.reflect.class.enumconstructorinfo" -->
# EnumConstructorInfo.get

[← EnumConstructorInfo](index.md)

## 签名

```cangjie role=signature
public static func get(qualifiedName: String): EnumConstructorInfo
```

获取给定限定名称所对应的 EnumConstructorInfo。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- qualifiedName: String - 枚举构造子的限定名称，例如 `default.E.M2<Int64>`。

## 返回值

- EnumConstructorInfo - 与 `qualifiedName` 对应的枚举构造子信息。

## 异常

- IllegalTypeException - 如果 `qualifiedName` 对应的类型不是枚举类型或不存在，则抛出异常。

