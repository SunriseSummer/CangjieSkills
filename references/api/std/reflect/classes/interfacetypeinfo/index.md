<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.interfacetypeinfo" parent="std.reflect" -->
# InterfaceTypeInfo

[← std.reflect](../../index.md)

`InterfaceTypeInfo <: TypeInfo`

`interface` 类型的类型信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`sealedSubtypes: Collection<TypeInfo>`](prop-sealedsubtypes.md) | 如果该 InterfaceTypeInfo 所对应的 `interface` 类型拥有 `sealed` 语义，则获取该 `interface` 类型所在包内的所有子类型的类型信息，返回对应集合。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`redef static get(qualifiedName: String): InterfaceTypeInfo`](get.md) | 获取给定 `qualifiedName` 所对应的类型的 InterfaceTypeInfo。 |
| [`redef static of(a: Any): InterfaceTypeInfo`](of.md) | 获取给定的任意类型实例的运行时类型所对应的类型信息。 |
| [`redef static of<T>(): InterfaceTypeInfo`](of.md) | 获取给定 `T` 类型对应的类型信息。 |
| [`isSealed(): Bool`](issealed.md) | 判断该 InterfaceTypeInfo 所对应的 `interface` 类型是否拥有 `sealed` 语义。 |
