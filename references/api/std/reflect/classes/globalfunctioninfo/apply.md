<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.globalfunctioninfo.apply" parent="std.reflect.class.globalfunctioninfo" -->
# GlobalFunctionInfo.apply

[← GlobalFunctionInfo](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func apply(Array<Any>)

### 签名

```cangjie role=signature
public func apply(args: Array<Any>): Any
```

调用该 GlobalFunctionInfo 对应的全局函数，传入实参列表，返回调用结果。

### 契约

> **注意：**
>
> `args` 的类型确保和函数入参类型完全一致，否则会导致参数检查失败。

参数：

- args: Array\<Any> - 实参列表。

返回值：

- Any - 该全局函数的调用结果。

异常：

- InvocationTargetException - 如果存在泛型参数的函数调用了该方法，则抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的实参的数目与该全局函数信息 `GlobalFunctionInfo` 所对应的全局函数的形参列表中的形参的数目不等，则抛出异常。
- IllegalTypeException - 如果实参列表 `args` 中的任何一个实参的运行时类型不是该全局函数信息所对应的全局函数的对应形参的声明类型的子类型，则抛出异常。
- Exception - 如果被调用的全局函数信息所对应全局函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出。

## func apply(Array<TypeInfo>, Array<Any>)

### 签名

```cangjie role=signature
public func apply(genericTypeArgs: Array<TypeInfo>, args: Array<Any>): Any
```

调用该 GlobalFunctionInfo 对应的全局泛型函数，传入泛型参数类型列表和实参列表，返回调用结果。

### 契约

> **注意：**
>
> `args` 的类型确保和函数入参类型完全一致，否则会导致参数检查失败。

参数：

- genericTypeArgs: Array\<TypeInfo> - 泛型参数类型列表。
- args: Array\<Any> - 实参列表。

返回值：

- Any - 该全局函数的调用结果。

异常：

- InvocationTargetException - 如果非泛型函数调用了该方法，则抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的实参的数目与该全局函数信息 `GlobalFunctionInfo` 所对应的全局函数的形参列表中的形参的数目不等，则抛出异常。
- IllegalArgumentException - 如果函数泛型参数列表 `genericTypeArgs` 中的参数数目与该全局函数信息所对应的全局函数的泛型参数列表 `genericParams` 中的参数数目不等，则抛出异常。
- IllegalTypeException - 如果实参列表 `args` 中的任何一个实参的运行时类型不是该全局函数信息所对应的全局函数的对应形参的声明类型的子类型，则抛出异常。
- IllegalTypeException - 如果传入的参数列表 `args` 和泛型参数类型列表 `genericTypeArgs` 不满足该全局函数信息所对应的全局函数的参数的类型约束，则抛出异常。
- Exception - 如果被调用的全局函数信息所对应全局函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出。
