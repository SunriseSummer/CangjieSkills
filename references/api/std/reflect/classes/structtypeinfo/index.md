<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.structtypeinfo" parent="std.reflect" -->
# StructTypeInfo

[← std.reflect](../../index.md)

`StructTypeInfo <: TypeInfo`

描述 `struct` 类型的类型信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`constructors: Collection<ConstructorInfo>`](prop-constructors.md) | 获取该 StructTypeInfo 对应的 `struct` 的所有 `public` 构造函数信息，返回对应集合。 |
| [`instanceVariables: Collection<InstanceVariableInfo>`](prop-instancevariables.md) | 获取该 StructTypeInfo 对应的 `struct` 的所有 `public` 实例成员变量信息，返回对应集合。 |
| [`staticVariables: Collection<StaticVariableInfo>`](prop-staticvariables.md) | 获取该 StructTypeInfo 对应的 `struct` 的所有 `public` 静态成员变量信息，返回对应集合。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static redef get(qualifiedName: String): StructTypeInfo`](get.md) | 获取给定 `qualifiedName` 所对应的类型的 StructTypeInfo。 |
| [`static redef of(a: Any): StructTypeInfo`](of.md) | 获取给定的任意类型实例的运行时类型所对应的类型信息。 |
| [`static redef of<T>(): StructTypeInfo`](of.md) | 获取给定 `T` 类型对应的类型信息。 |
| [`construct(args: Array<Any>): Any`](construct.md) | 在该 StructTypeInfo 对应的 `struct` 类型中根据实参列表搜索匹配的构造函数并调用，传入实参列表，返回调用结果。 |
| [`getConstructor(parameterTypes: Array<TypeInfo>): ConstructorInfo`](getconstructor.md) | 尝试在该 StructTypeInfo 对应的 `struct` 类型中获取与给定形参类型信息列表匹配的 `public` 构造函数的信息。 |
| [`getInstanceVariable(name: String): InstanceVariableInfo`](getinstancevariable.md) | 给定变量名称，尝试获取该 StructTypeInfo 对应的 `struct` 类型中匹配的实例成员变量的信息。 |
| [`getStaticVariable(name: String): StaticVariableInfo`](getstaticvariable.md) | 给定变量名称，尝试获取该 StructTypeInfo 对应的 `struct` 类型中匹配的静态成员变量的信息。 |
