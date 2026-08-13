<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.constructorinfo.apply" parent="std.reflect.class.constructorinfo" -->
# ConstructorInfo.apply

[← ConstructorInfo](index.md)

## 签名

```cangjie role=signature
public func apply(args: Array<Any>): Any
```

调用该 ConstructorInfo 对应的构造函数，传入实参列表，并返回调用结果。

## 契约

参数：

- args: Array\<Any> - 实参列表。

返回值：

- Any - 由该构造函数构造得到的类型实例。

异常：

- InvocationTargetException - 如果该构造函数信息所对应的构造函数所属的类型是抽象类，则会抛出异常。
- IllegalArgumentException - 如果实参列表 `args` 中的实参的数目与该构造函数信息所对应的构造函数的形参列表中的形参的数目不等，则抛出异常。
- IllegalTypeException - 如果实参列表 `args` 中的任何一个实参的运行时类型不是该构造函数信息所对应的构造函数的对应形参的声明类型的子类型，则抛出异常。
- Exception - 如果被调用的构造函数信息所对应的构造函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出。
