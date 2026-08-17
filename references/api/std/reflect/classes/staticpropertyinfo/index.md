<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.staticpropertyinfo" parent="std.reflect" -->
# StaticPropertyInfo

[← std.reflect](../../index.md)

`StaticPropertyInfo <: Equatable<StaticPropertyInfo> & Hashable & ToString`

描述静态成员属性信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该 StaticPropertyInfo 所对应的静态成员属性的注解所组成的集合。 |
| [`modifiers: Collection<ModifierInfo>`](prop-modifiers.md) | 获取该 StaticPropertyInfo 对应的静态成员属性所拥有的所有修饰符的信息，返回对应集合。 |
| [`name: String`](prop-name.md) | 获取该 StaticPropertyInfo 对应的静态成员属性的名称。 |
| [`typeInfo: TypeInfo`](prop-typeinfo.md) | 获取该 StaticPropertyInfo 对应的静态成员属性的声明类型的类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`findAnnotation<T>(): Option<T> where T <: Annotation`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`getValue(): Any`](getvalue.md) | 获取该 StaticPropertyInfo 对应的静态成员属性的值。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该静态成员属性信息的哈希值。 |
| [`isMutable(): Bool`](ismutable.md) | 判断该静态成员属性信息所对应的静态成员属性是否可修改。 |
| [`setValue(newValue: Any): Unit`](setvalue.md) | 设置该 StaticPropertyInfo 对应的静态成员属性的值。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该静态成员属性信息。 |
| [`func findAllAnnotations<T>(): Array<T> where T <: Annotation`](findallannotations.md) | 获取所有指定注解名称的自定义注解（通过泛型筛选）。 |
| [`func getAllAnnotations(): Array<Annotation>`](getallannotations.md) | 获取作用于该对象的所有自定义注解。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: StaticPropertyInfo): Bool`](operator-ne.md) | 判断该静态成员属性信息与给定的另一个静态成员属性信息是否不等。 |
| [`operator ==(that: StaticPropertyInfo): Bool`](operator-eq.md) | 判断该静态成员属性信息与给定的另一个静态成员属性信息是否相等。 |
