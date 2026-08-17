<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.tupletypeinfo" parent="std.reflect" -->
# TupleTypeInfo

[← std.reflect](../../index.md)

`class TupleTypeInfo <: TypeInfo`

描述元组类型的类型信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop elements: ReadOnlyList<TypeInfo>`](prop-elements.md) | 获取该 TupleTypeInfo 对应元组中各元素的类型信息列表，按元组声明顺序返回。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`redef static func of(instance: Any): TupleTypeInfo（2 个重载）`](of.md) | 获取给定实例的运行时类型所对应的 TupleTypeInfo。 |
| [`func construct(args: Array<Any>): Any`](construct.md) | 按元组各元素的顺序传入实参列表，构造该 TupleTypeInfo 对应的元组实例，返回构造结果。 |
| [`func destruct(instance: Any): ReadOnlyList<Any>`](destruct.md) | 将指定元组实例拆解为各元素的只读列表并返回。 |

