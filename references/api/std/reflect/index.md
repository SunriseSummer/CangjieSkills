<!-- cj-doc kind="api-package" level="4" id="std.reflect" parent="api.std" -->
# std.reflect

[← std 包索引](../index.md)

在运行时查询类型信息，并动态读写或调用成员。

包路径：`std.reflect`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`ClassTypeInfo <: TypeInfo`](classes/classtypeinfo/index.md) | 描述 `class` 类型的类型信息。 |
| [`ConstructorInfo <: Equatable<ConstructorInfo> & Hashable & ToString`](classes/constructorinfo/index.md) | 描述构造函数信息。 |
| [`GenericTypeInfo <: TypeInfo & Equatable<GenericTypeInfo>`](classes/generictypeinfo/index.md) | 描述泛型类型信息。 |
| [`GlobalFunctionInfo <: Equatable<GlobalFunctionInfo> & Hashable & ToString`](classes/globalfunctioninfo/index.md) | 描述全局函数信息。 |
| [`GlobalVariableInfo <: Equatable<GlobalVariableInfo> & Hashable & ToString`](classes/globalvariableinfo/index.md) | 描述全局变量信息。 |
| [`InstanceFunctionInfo <: Equatable<InstanceFunctionInfo> & Hashable & ToString`](classes/instancefunctioninfo/index.md) | 描述实例成员函数信息。 |
| [`InstancePropertyInfo <: Equatable<InstancePropertyInfo> & Hashable & ToString`](classes/instancepropertyinfo/index.md) | 描述实例成员属性信息。 |
| [`InstanceVariableInfo <: Equatable<InstanceVariableInfo> & Hashable & ToString`](classes/instancevariableinfo/index.md) | 描述实例成员变量信息。 |
| [`InterfaceTypeInfo <: TypeInfo`](classes/interfacetypeinfo/index.md) | `interface` 类型的类型信息。 |
| [`PackageInfo <: Equatable<PackageInfo> & Hashable & ToString`](classes/packageinfo/index.md) | 描述包信息。 |
| [`ParameterInfo <: Equatable<ParameterInfo> & Hashable & ToString`](classes/parameterinfo/index.md) | 描述函数形参信息。 |
| [`PrimitiveTypeInfo <: TypeInfo`](classes/primitivetypeinfo/index.md) | 描述原始数据类型的类型信息。 |
| [`StaticFunctionInfo <: Equatable<StaticFunctionInfo> & Hashable & ToString`](classes/staticfunctioninfo/index.md) | 描述静态成员函数信息。 |
| [`StaticPropertyInfo <: Equatable<StaticPropertyInfo> & Hashable & ToString`](classes/staticpropertyinfo/index.md) | 描述静态成员属性信息。 |
| [`StaticVariableInfo <: Equatable<StaticVariableInfo> & Hashable & ToString`](classes/staticvariableinfo/index.md) | 描述静态成员变量信息。 |
| [`StructTypeInfo <: TypeInfo`](classes/structtypeinfo/index.md) | 描述 `struct` 类型的类型信息。 |
| [`sealed abstract TypeInfo <: Equatable<TypeInfo> & Hashable & ToString`](classes/typeinfo/index.md) | TypeInfo 提供了所有数据类型通用的操作接口。 |
| [`IllegalSetException <: ReflectException`](classes/illegalsetexception/index.md) | IllegalSetException 为对不可变类型进行更改异常。 |
| [`IllegalTypeException <: ReflectException`](classes/illegaltypeexception/index.md) | IllegalTypeException 为类型不匹配异常。 |
| [`InfoNotFoundException <: ReflectException`](classes/infonotfoundexception/index.md) | InfoNotFoundException 为无法找到对应信息异常。 |
| [`InvocationTargetException <: ReflectException`](classes/invocationtargetexception/index.md) | InvocationTargetException 为调用函数包装异常。 |
| [`MisMatchException <: ReflectException`](classes/mismatchexception/index.md) | MisMatchException 为调用对应函数抛出异常。 |
| [`open ReflectException <: Exception`](classes/reflectexception/index.md) | ReflectException 为 Reflect 包的基异常类。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`ModifierInfo <: Equatable<ModifierInfo> & Hashable & ToString`](enums/modifierinfo/index.md) | 描述修饰符信息。 |

## 类型别名

| 声明 | 功能 |
|---|---|
| [`Annotation = Object`](types/annotation-object.md) | Object 的别名。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`parseParameterTypes(parameters: String): Array<TypeInfo>`](functions/parseparametertypes-string.md) | 从字符串中解析出参数类型，并将其转换为类型数组，以便`getStaticFunction`等函数使用。 |
