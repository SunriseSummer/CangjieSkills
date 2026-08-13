<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.instancefunctioninfo" parent="std.reflect" -->
# InstanceFunctionInfo

[← std.reflect](../../index.md)

`InstanceFunctionInfo <: Equatable<InstanceFunctionInfo> & Hashable & ToString`

描述实例成员函数信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该 InstanceFunctionInfo 对应的实例成员函数的注解，返回对应集合。 |
| [`genericParams: Collection<GenericTypeInfo>`](prop-genericparams.md) | 获取该 InstanceFunctionInfo 对应的实例成员函数的泛型参数信息列表。 |
| [`modifiers: Collection<ModifierInfo>`](prop-modifiers.md) | 获取该 InstanceFunctionInfo 对应的实例成员函数所拥有的所有修饰符的信息，返回对应集合。 |
| [`name: String`](prop-name.md) | 获取该 InstanceFunctionInfo 对应的实例成员函数的名称。 |
| [`parameters: ReadOnlyList<ParameterInfo>`](prop-parameters.md) | 获取该 InstanceFunctionInfo 对应的实例成员函数的参数信息列表。 |
| [`returnType: TypeInfo`](prop-returntype.md) | 获取该 InstanceFunctionInfo 对应的实例成员函数的返回值类型的类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`apply(instance: Any, args: Array<Any>): Any`](apply.md) | 调用该 InstanceFunctionInfo 对应实例成员函数，指定实例并传入实参列表，返回调用结果。 |
| [`apply(instance: Any, genericTypeArgs: Array<TypeInfo>, args: Array<Any>): Any`](apply.md) | 调用该 InstanceFunctionInfo 对应泛型成员函数，指定实例并传入泛型参数的类型列表和参数列表，返回调用结果。 |
| [`findAnnotation<T>(): Option<T> where T <: Annotation`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该实例成员函数信息的哈希值。 |
| [`isAbstract(): Bool`](isabstract.md) | 判断 InstanceFunctionInfo 所对应的实例成员函数是否拥有 `abstract` 语义。 |
| [`isOpen(): Bool`](isopen.md) | 判断该 InstanceFunctionInfo 对应的实例成员函数是否拥有 `open` 语义。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该实例成员函数信息。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: InstanceFunctionInfo): Bool`](operator-ne.md) | 判断该实例成员函数信息与给定的另一个实例成员函数信息是否不等。 |
| [`operator ==(that: InstanceFunctionInfo): Bool`](operator-eq.md) | 判断该实例成员函数信息与给定的另一个实例成员函数信息是否相等。 |
