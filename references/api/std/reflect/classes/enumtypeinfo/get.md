<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumtypeinfo.get" parent="std.reflect.class.enumtypeinfo" -->
# EnumTypeInfo.get

[← EnumTypeInfo](index.md)

## 签名

```cangjie role=signature
public redef static func get(qualifiedName: String): EnumTypeInfo
```

获取给定限定名称所对应类型的 EnumTypeInfo。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- qualifiedName: String - 类型的限定名称。

## 返回值

- EnumTypeInfo - 与 `qualifiedName` 对应的枚举类型信息。

## 异常

- IllegalTypeException - 如果获取到的类型信息不是枚举类型或者 qaulifiedName 对应的定义不存在，则抛出异常。

