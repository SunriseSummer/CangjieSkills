<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.functiontypeinfo.apply" parent="std.reflect.class.functiontypeinfo" -->
# FunctionTypeInfo.apply

[← FunctionTypeInfo](index.md)

## 签名

```cangjie role=signature
public func apply(instance: Any, args: Array<Any>): Any
```

按函数参数顺序传入实参列表，对函数进行调用并返回调用结果。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 函数实例。
- args: Array<Any> - 实参列表。

## 返回值

- Any - 调用结果。

## 异常

- IllegalArgumentException - 如果 `args` 的数量与函数参数个数不一致，则抛出异常。
- IllegalTypeException - 如果 `args` 中任一元素类型与对应元组元素类型不匹配，则抛出异常。

