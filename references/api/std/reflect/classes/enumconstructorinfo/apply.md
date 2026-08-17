<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumconstructorinfo.apply" parent="std.reflect.class.enumconstructorinfo" -->
# EnumConstructorInfo.apply

[← EnumConstructorInfo](index.md)

## 签名

```cangjie role=signature
public func apply(args: Array<Any>): Any
```

根据传入的参数列表，构造相应的枚举实例。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- args: Array<Any> - 构造子参数的实参列表，顺序需与构造子声明一致。

## 返回值

- Any - 由该构造子创建的枚举实例。

## 异常

- InvocationTargetException - 当实参个数与构造子参数个数不一致，或任一实参的运行时类型与对应形参类型不匹配时抛出。

