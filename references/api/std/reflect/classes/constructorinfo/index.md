<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.constructorinfo" parent="std.reflect" -->
# ConstructorInfo

[← std.reflect](../../index.md)

`ConstructorInfo <: Equatable<ConstructorInfo> & Hashable & ToString`

描述构造函数信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该 ConstructorInfo 对应的构造函数的注解，返回对应集合。 |
| [`parameters: ReadOnlyList<ParameterInfo>`](prop-parameters.md) | 获取该 ConstructorInfo 所对应的构造函数的参数类型列表。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`apply(args: Array<Any>): Any`](apply.md) | 调用该 ConstructorInfo 对应的构造函数，传入实参列表，并返回调用结果。 |
| [`findAnnotation<T>(): Option<T> where T <: Annotation`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该构造器信息的哈希值。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该构造函数信息。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: ConstructorInfo): Bool`](operator-ne.md) | 判断该构造器信息与给定的另一个构造器信息是否不等。 |
| [`operator ==(that: ConstructorInfo): Bool`](operator-eq.md) | 判断该构造器信息与给定的另一个构造器信息是否相等。 |
