<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumtypeinfo.of" parent="std.reflect.class.enumtypeinfo" -->
# EnumTypeInfo.of

[← EnumTypeInfo](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public static redef func of(instance: Any): EnumTypeInfo
```

获取给定实例所属枚举类型的 EnumTypeInfo。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 枚举实例。

## 返回值

- EnumTypeInfo - `instance` 所属枚举类型的类型信息。

## 异常

- IllegalTypeException - 如果 `instance` 不是枚举类型，则抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public static redef func of<T>(): EnumTypeInfo
```

获取给定类型 `T` 所属枚举类型的 EnumTypeInfo。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 返回值

- EnumTypeInfo - `T` 所属枚举类型的类型信息。

## 异常

- IllegalTypeException - 如果 `T` 不是任何枚举类型，则抛出异常。

