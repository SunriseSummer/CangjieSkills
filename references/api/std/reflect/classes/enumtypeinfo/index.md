<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.enumtypeinfo" parent="std.reflect" -->
# EnumTypeInfo

[← std.reflect](../../index.md)

`class EnumTypeInfo <: TypeInfo`

`Enum` 类型的类型信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop constructors: Collection<EnumConstructorInfo>`](prop-constructors.md) | 获取该 EnumTypeInfo 对应的所有枚举构造子信息，返回对应集合。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`redef static func get(qualifiedName: String): EnumTypeInfo`](get.md) | 获取给定限定名称所对应类型的 EnumTypeInfo。 |
| [`static redef func of(instance: Any): EnumTypeInfo（2 个重载）`](of.md) | 获取给定实例所属枚举类型的 EnumTypeInfo。 |
| [`func construct(constructor: String, args: Array<Any>): Any`](construct.md) | 根据构造子签名和实参列表构造该枚举的实例并返回。 |
| [`func destruct(instance: Any): (EnumConstructorInfo, ReadOnlyList<Any>)`](destruct.md) | 拆解给定枚举实例，返回其构造子信息和关联值列表。 |
| [`func getConstructor(constructor: String, argsCount!: Int64 = 0): EnumConstructorInfo`](getconstructor.md) | 按构造子名与参数个数查询构造子信息。 |

