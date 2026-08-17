<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.functiontypeinfo.of" parent="std.reflect.class.functiontypeinfo" -->
# FunctionTypeInfo.of

[← FunctionTypeInfo](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public redef static func of(instance: Any): FunctionTypeInfo
```

获取给定实例的运行时类型所对应的 FunctionTypeInfo。

运行时类型是指在程序运行时，通过动态绑定确定的类型，运行时类型与实例对象相绑定。在继承等场景下运行时类型和静态类型可能不一致。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 运行时类型为函数类型的实例。

## 返回值

- FunctionTypeInfo - 实例 `instance` 的运行时类型所对应的类型信息。

## 异常

- IllegalTypeException - 如果获取到的类型信息不是函数类型，则抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public static redef func of<T>(): FunctionTypeInfo
```

获取给定类型 `T` 对应的 FunctionTypeInfo。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 返回值

- FunctionTypeInfo - `T` 类型对应的函数类型信息。

## 异常

- IllegalTypeException - 如果获取到的类型信息不是函数类型，则抛出异常。

