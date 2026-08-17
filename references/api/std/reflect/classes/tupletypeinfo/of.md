<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.tupletypeinfo.of" parent="std.reflect.class.tupletypeinfo" -->
# TupleTypeInfo.of

[← TupleTypeInfo](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public redef static func of(instance: Any): TupleTypeInfo
```

获取给定实例的运行时类型所对应的 TupleTypeInfo。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 运行时类型为元组的实例。

## 返回值

- TupleTypeInfo - 实例 `instance` 的运行时类型所对应的类型信息。

## 异常

- IllegalTypeException - 如果获取到的类型信息不是 TupleTypeInfo，则抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public static redef func of<T>(): TupleTypeInfo
```

获取给定类型 `T` 对应的 TupleTypeInfo。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 返回值

- TupleTypeInfo - `T` 类型对应的元组类型信息。

## 异常

- IllegalTypeException - 如果获取到的类型信息不是 TupleTypeInfo，则抛出异常。

