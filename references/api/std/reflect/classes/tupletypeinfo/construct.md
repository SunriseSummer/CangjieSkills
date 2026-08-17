<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.tupletypeinfo.construct" parent="std.reflect.class.tupletypeinfo" -->
# TupleTypeInfo.construct

[← TupleTypeInfo](index.md)

## 签名

```cangjie role=signature
public func construct(args: Array<Any>): Any
```

按元组各元素的顺序传入实参列表，构造该 TupleTypeInfo 对应的元组实例，返回构造结果。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- args: Array<Any> - 元组各元素的取值，顺序与元组声明一致。

## 返回值

- Any - 构造出的元组实例。

## 异常

- IllegalArgumentException - 如果 `args` 的数量与元组元素数量不一致，则抛出异常。
- IllegalTypeException - 如果 `args` 中任一元素类型与对应元组元素类型不匹配，则抛出异常。

