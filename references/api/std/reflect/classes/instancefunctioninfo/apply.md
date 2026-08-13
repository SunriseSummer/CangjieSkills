<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancefunctioninfo.apply" parent="std.reflect.class.instancefunctioninfo" -->
# InstanceFunctionInfo.apply

[← InstanceFunctionInfo](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func apply(Any, Array<Any>)

### 签名

```cangjie role=signature
public func apply(instance: Any, args: Array<Any>): Any
```

调用该 InstanceFunctionInfo 对应实例成员函数，指定实例并传入实参列表，返回调用结果。

### 契约

> **注意：**
>
> `args` 的类型确保和函数入参类型完全一致。

参数：

- instance: Any - 实例。
- args: Array\<Any> - 实参列表。

返回值：

- Any - 该实例成员函数的调用结果。

异常：

- InvocationTargetException - 如果存在泛型参数的函数调用了该方法，则抛出异常。
- InvocationTargetException - 如果该实例成员函数信息所对应的实例成员函数是抽象的，或不存在相应的函数实现，则抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的实参的数目与该实例成员函数信息所对应的实例成员函数的形参列表中的形参的数目不等，则抛出异常。
- IllegalTypeException - 如果实例 `instance` 的运行时类型与该实例成员函数信息所对应的实例成员函数所属的类型不相同，则抛出异常。
- IllegalTypeException - 如果实参列表 `args` 中的任何一个实参的运行时类型不是该实例成员函数信息所对应的实例成员函数的对应形参的声明类型的子类型，则抛出异常。
- Exception - 如果被调用的实例成员函数信息所对应的实例成员函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出。

## func apply(Any, Array<TypeInfo>, Array<Any>)

### 签名

```cangjie role=signature
public func apply(instance: Any, genericTypeArgs: Array<TypeInfo>, args: Array<Any>): Any
```

调用该 InstanceFunctionInfo 对应泛型成员函数，指定实例并传入泛型参数的类型列表和参数列表，返回调用结果。

### 契约

> **注意：**
>
> `args` 的类型确保和函数入参类型完全一致。

参数：

- instance: Any - 实例。
- genericTypeArgs: Array\<TypeInfo> - 泛型参数类型信息列表。
- args: Array\<Any> - 泛型参数列表。

返回值：

- Any - 该实例泛型函数的调用结果。

异常：

- InvocationTargetException - 如果该函数信息对应的成员函数是 `abstract` 或不存在函数体，则会抛出异常。
- InvacationTargetException - 如果非泛型函数调用了此方法，则抛出异常。
- IllegalTypeException - 如果实例 `instance` 的运行时类型与该成员函数信息所对应的成员函数所属的类型不相同，则抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的实参的数目与该成员函数信息所对应的成员函数的形参列表中的形参的数目不等，则抛出异常。
- IllegalArgumentException - 如果函数泛型参数列表 `genericTypeArgs` 中的参数数目与该成员函数信息所对应的成员函数的泛型参数列表 `genericParams` 中的参数数目不等，则抛出异常。
- IllegalTypeException - 如果参数列表 `args` 中的任何一个参数的运行时类型不是该实例成员函数信息所对应的实例成员函数的对应形参的声明类型的子类型，则抛出异常。
- IllegalTypeException - 如果传入的参数列表 `args` 和泛型参数类型列表 `genericTypeArgs` 不满足该成员函数信息所对应的成员函数的参数的类型约束，则抛出异常。
- Exception - 如果被调用的实例成员函数信息所对应的实例成员函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出。
