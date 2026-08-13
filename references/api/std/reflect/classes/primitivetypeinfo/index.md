<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.primitivetypeinfo" parent="std.reflect" -->
# PrimitiveTypeInfo

[← std.reflect](../../index.md)

`PrimitiveTypeInfo <: TypeInfo`

描述原始数据类型的类型信息。

## 方法

| 签名 | 功能 |
|---|---|
| [`static redef get(qualifiedName: String): PrimitiveTypeInfo`](get.md) | 获取给定的类型的限定名称所对应类型的 PrimitiveTypeInfo。 |
| [`static redef of(a: Any): PrimitiveTypeInfo`](of.md) | 获取给定的任意类型实例的运行时类型所对应的类型信息。 |
| [`static redef of<T>(): PrimitiveTypeInfo`](of.md) | 获取给定 `T` 类型对应的类型信息。 |
