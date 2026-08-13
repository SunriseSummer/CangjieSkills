<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticfunctioninfo.apply" parent="std.reflect.class.staticfunctioninfo" -->
# StaticFunctionInfo.apply

[← StaticFunctionInfo](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func apply(TypeInfo, Array<Any>)

### 签名

```cangjie role=signature
public func apply(thisType: TypeInfo, args: Array<Any>): Any
```

调用该 StaticFunctionInfo 对应静态成员函数，传入方法所属的类型信息和实参列表并返回调用结果。

### 契约

> **注意：**
>
> `args` 的类型确保和函数入参类型完全一致，否则会导致参数检查失败。

参数：

- thisType: TypeInfo - 该方法所属的类。
- args: Array\<Any> - 实参列表。

返回值：

- Any - 该静态成员函数的调用结果。

异常：

- InvocationTargetException - 如果该函数信息对应的静态成员函数存在泛型参数，则会抛出异常。
- InfoNotFoundException - 如果该函数信息对应的静态成员函数的函数体未实现，则会抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的实参的数目与该静态成员函数信息所对应的静态成员函数的形参列表中的形参的数目不等，则抛出异常。
- IllegalArgumentException - 如果 `thisType` 和该静态函数的函数签名不一致，则抛出异常。
- IllegalTypeException - 如果实参列表 `args` 中的任何一个实参的运行时类型不是该静态成员函数信息所对应的静态成员函数的对应形参的声明类型的子类型，则抛出异常。
- Exception - 如果被调用的静态成员函数信息所对应的静态成员函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出。

## func apply(TypeInfo, Array<TypeInfo>, Array<Any>)

### 签名

```cangjie role=signature
public func apply(thisType: TypeInfo, genericTypeArgs: Array<TypeInfo>, args: Array<Any>): Any
```

调用该 StaticFunctionInfo 对应静态成员函数，传入方法所属的类型信息和实参列表并返回调用结果。

### 契约

> **注意：**
>
> `args` 的类型确保和函数入参类型完全一致，否则会导致参数检查失败。

参数：

- thisType: TypeInfo - 该方法所属的类。
- genericTypeArgs: Array\<TypeInfo> - 泛型参数类型列表。
- args: Array\<Any> - 实参列表。

返回值：

- Any - 该静态成员函数的调用结果。

异常：

- InvocationTargetException -  如果该函数信息对应的静态成员函数是非泛型函数，则抛出异常。
- InfoNotFoundException - 如果该函数信息对应的静态成员函数的函数体未实现，则会抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的实参的数目与该静态成员函数信息所对应的静态成员函数的形参列表中的形参的数目不等，则抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的泛型参数的数目与该静态成员函数信息所对应的泛型参数的数目不等，则抛出异常。
- IllegalArgumentException - 如果 `thisType` 和该静态函数的函数签名不一致，则抛出异常。
- IllegalTypeException - 如果实参列表 `args` 中的任何一个实参的运行时类型不是该静态成员函数信息所对应的静态成员函数的对应形参的声明类型的子类型，则抛出异常。
- IllegalTypeException - 如果传入的参数列表 `args` 和泛型参数类型列表 `genericTypeArgs` 不满足该静态成员函数信息所对应的静态成员函数的参数的类型约束，则抛出异常。
- Exception - 如果被调用的静态成员函数信息所对应的静态成员函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出。
