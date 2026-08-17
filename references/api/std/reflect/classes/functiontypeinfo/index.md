<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.functiontypeinfo" parent="std.reflect" -->
# FunctionTypeInfo

[← std.reflect](../../index.md)

`class FunctionTypeInfo <: TypeInfo`

描述函数类型（函数值/闭包）的类型信息，可用于获取参数与返回值的类型信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop parameters: ReadOnlyList<TypeInfo>`](prop-parameters.md) | 获取该函数类型的参数类型列表，按声明顺序返回。 |
| [`prop returnType: TypeInfo`](prop-returntype.md) | 获取该函数类型的返回值类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`redef static func of(instance: Any): FunctionTypeInfo（2 个重载）`](of.md) | 获取给定实例的运行时类型所对应的 FunctionTypeInfo。 |
| [`func apply(instance: Any, args: Array<Any>): Any`](apply.md) | 按函数参数顺序传入实参列表，对函数进行调用并返回调用结果。 |

