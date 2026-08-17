<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.staticfunctioninfo" parent="std.reflect" -->
# StaticFunctionInfo

[← std.reflect](../../index.md)

`StaticFunctionInfo <: Equatable<StaticFunctionInfo> & Hashable & ToString`

描述静态成员函数信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该 StaticFunctionInfo 对应的静态成员函数的注解，返回对应集合。 |
| [`genericParams: Collection<GenericTypeInfo>`](prop-genericparams.md) | 获取该 StaticFunctionInfo 对应的实例成员函数的泛型参数信息列表。 |
| [`modifiers: Collection<ModifierInfo>`](prop-modifiers.md) | 获取该 StaticFunctionInfo 对应的静态成员函数所拥有的所有修饰符的信息，返回对应集合。 |
| [`name: String`](prop-name.md) | 获取该 StaticFunctionInfo 对应的静态成员函数的名称。 |
| [`parameters: ReadOnlyList<ParameterInfo>`](prop-parameters.md) | 获取该 StaticFunctionInfo 对应的静态成员函数的参数信息列表。 |
| [`returnType: TypeInfo`](prop-returntype.md) | 获取该 StaticFunctionInfo 对应的静态成员函数的返回值类型的类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`apply(thisType: TypeInfo, args: Array<Any>): Any`](apply.md) | 调用该 StaticFunctionInfo 对应静态成员函数，传入方法所属的类型信息和实参列表并返回调用结果。 |
| [`apply(thisType: TypeInfo, genericTypeArgs: Array<TypeInfo>, args: Array<Any>): Any`](apply.md) | 调用该 StaticFunctionInfo 对应静态成员函数，传入方法所属的类型信息和实参列表并返回调用结果。 |
| [`findAnnotation<T>(): Option<T> where T <: Annotation`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该静态成员函数信息的哈希值。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该静态成员函数信息。 |
| [`func findAllAnnotations<T>(): Array<T> where T <: Annotation`](findallannotations.md) | 获取所有指定注解名称的自定义注解（通过泛型筛选）。 |
| [`func getAllAnnotations(): Array<Annotation>`](getallannotations.md) | 获取作用于该对象的所有自定义注解。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: StaticFunctionInfo): Bool`](operator-ne.md) | 判断该静态成员函数信息与给定的另一个静态成员函数信息是否不等。 |
| [`operator ==(that: StaticFunctionInfo): Bool`](operator-eq.md) | 判断该静态成员函数信息与给定的另一个静态成员函数信息是否相等。 |
