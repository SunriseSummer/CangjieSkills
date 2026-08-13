<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.typeinfo" parent="std.reflect" -->
# TypeInfo

[← std.reflect](../../index.md)

`sealed abstract TypeInfo <: Equatable<TypeInfo> & Hashable & ToString`

TypeInfo 提供了所有数据类型通用的操作接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该 TypeInfo 对应的类型的注解，返回对应集合。 |
| [`instanceFunctions: Collection<InstanceFunctionInfo>`](prop-instancefunctions.md) | 获取该 TypeInfo 对应类型的所有 `public` 实例成员函数信息，返回对应集合。 |
| [`instanceProperties: Collection<InstancePropertyInfo>`](prop-instanceproperties.md) | 获取该 TypeInfo 对应类型的所有 `public` 实例成员属性信息，返回对应集合。 |
| [`modifiers: Collection<ModifierInfo>`](prop-modifiers.md) | 获取该 TypeInfo 对应的类型拥有的所有修饰符的信息，返回对应集合。 |
| [`name: String`](prop-name.md) | 获取该 TypeInfo 对应的类型的名称。 |
| [`qualifiedName: String`](prop-qualifiedname.md) | 获取该 TypeInfo 对应的类型的限定名称。 |
| [`staticFunctions: Collection<StaticFunctionInfo>`](prop-staticfunctions.md) | 获取该 TypeInfo 对应类型的所有 `public` 静态成员函数信息，返回对应集合。 |
| [`staticProperties: Collection<StaticPropertyInfo>`](prop-staticproperties.md) | 获取该 TypeInfo 对应类型的所有 `public` 静态成员属性信息，返回对应集合。 |
| [`superInterfaces: Collection<InterfaceTypeInfo>`](prop-superinterfaces.md) | 获取该 TypeInfo 对应的类型直接实现的所有 `interface` 类型的信息，返回对应集合。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static get(qualifiedName: String): TypeInfo`](get.md) | 获取给定 `qualifiedName` 所对应的类型的 TypeInfo。 |
| [`static of(a: Any): TypeInfo`](of.md) | 获取给定的任意类型实例的运行时类型所对应的类型信息。 |
| [`static of<T>(): TypeInfo`](of.md) | 获取给定 `T` 类型对应的类型信息。 |
| [`findAnnotation<T>(): Option<T>`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`getInstanceFunction(name: String, parameterTypes: Array<TypeInfo>): InstanceFunctionInfo`](getinstancefunction.md) | 给定函数名称与函数形参类型列表所对应的类型信息列表，尝试获取该类型中匹配的实例成员函数的信息。 |
| [`getInstanceFunctions(name: String): Array<InstanceFunctionInfo>`](getinstancefunctions.md) | 给定函数名称，尝试获取该类型中所有匹配的实例成员函数的信息。 |
| [`getInstanceProperty(name: String): InstancePropertyInfo`](getinstanceproperty.md) | 尝试获取该类型中与给定属性名称匹配的实例成员属性的信息。 |
| [`getStaticFunction(name: String, parameterTypes: Array<TypeInfo>): StaticFunctionInfo`](getstaticfunction.md) | 通过给定函数名称与函数形参类型列表所对应的类型信息列表，尝试获取该类型中匹配的静态成员函数的信息。 |
| [`getStaticFunctions(name: String): Array<StaticFunctionInfo>`](getstaticfunctions.md) | 给定函数名称，尝试获取该类型中所有匹配的静态成员函数的信息。 |
| [`getStaticProperty(name: String): StaticPropertyInfo`](getstaticproperty.md) | 尝试获取该类型中与给定属性名称匹配的静态成员属性的信息。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该类型信息的哈希值。 |
| [`isSubtypeOf(supertype: TypeInfo): Bool`](issubtypeof.md) | 判断当前 TypeInfo 实例对应的类型是否是参数中指定的 TypeInfo 实例表示的类型的子类型。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该类型信息。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: TypeInfo): Bool`](operator-ne.md) | 判断该类型信息与给定的另一个类型信息是否不等。 |
| [`operator ==(that: TypeInfo): Bool`](operator-eq.md) | 判断该类型信息与给定的另一个类型信息是否相等。 |
