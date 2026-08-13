<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.globalfunctioninfo" parent="std.reflect" -->
# GlobalFunctionInfo

[← std.reflect](../../index.md)

`GlobalFunctionInfo <: Equatable<GlobalFunctionInfo> & Hashable & ToString`

描述全局函数信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有 GlobalFunctionInfo 对应的全局函数的注解，返回对应集合。 |
| [`genericParams: Collection<GenericTypeInfo>`](prop-genericparams.md) | 获取该 GlobalFunctionInfo 对应的实例成员函数的泛型参数信息列表。 |
| [`name: String`](prop-name.md) | 获取该 GlobalFunctionInfo 对应的全局函数的名称。 |
| [`parameters: ReadOnlyList<ParameterInfo>`](prop-parameters.md) | 获取该 GlobalFunctionInfo 对应的全局函数的参数信息列表。 |
| [`returnType: TypeInfo`](prop-returntype.md) | 获取该 GlobalFunctionInfo 对应的全局函数的返回类型的类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`apply(args: Array<Any>): Any`](apply.md) | 调用该 GlobalFunctionInfo 对应的全局函数，传入实参列表，返回调用结果。 |
| [`apply(genericTypeArgs: Array<TypeInfo>, args: Array<Any>): Any`](apply.md) | 调用该 GlobalFunctionInfo 对应的全局泛型函数，传入泛型参数类型列表和实参列表，返回调用结果。 |
| [`findAnnotation<T>(): Option<T> where T <: Annotation`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该全局函数信息的哈希值。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该全局函数信息。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: GlobalFunctionInfo): Bool`](operator-ne.md) | 判断该全局函数信息与给定的另一个全局函数信息是否不等。 |
| [`operator ==(that: GlobalFunctionInfo): Bool`](operator-eq.md) | 判断该全局函数信息与给定的另一个全局函数信息是否相等。 |
