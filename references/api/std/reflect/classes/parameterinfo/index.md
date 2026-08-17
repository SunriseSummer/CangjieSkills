<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.parameterinfo" parent="std.reflect" -->
# ParameterInfo

[← std.reflect](../../index.md)

`ParameterInfo <: Equatable<ParameterInfo> & Hashable & ToString`

描述函数形参信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该 ParameterInfo 对应的函数形参的注解，返回对应集合。 |
| [`index: Int64`](prop-index.md) | 获知该 ParameterInfo 对应的形参是其所在函数的第几个形参。 |
| [`name: String`](prop-name.md) | 获取该 ParameterInfo 对应的形参的名称。 |
| [`typeInfo: TypeInfo`](prop-typeinfo.md) | 获取该 ParameterInfo 对应的函数形参的声明类型所对应的类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`findAnnotation<T>(): Option<T> where T <: Annotation`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该函数形参信息的哈希值。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该函数形参信息。 |
| [`func findAllAnnotations<T>(): Array<T> where T <: Annotation`](findallannotations.md) | 获取所有指定注解名称的自定义注解（通过泛型筛选）。 |
| [`func getAllAnnotations(): Array<Annotation>`](getallannotations.md) | 获取作用于该对象的所有自定义注解。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: ParameterInfo): Bool`](operator-ne.md) | 判断该函数形参信息与给定的另一个函数形参信息是否不等。 |
| [`operator ==(that: ParameterInfo): Bool`](operator-eq.md) | 判断该函数形参信息与给定的另一个函数形参信息是否相等。 |
