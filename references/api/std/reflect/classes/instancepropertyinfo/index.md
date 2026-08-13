<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.instancepropertyinfo" parent="std.reflect" -->
# InstancePropertyInfo

[← std.reflect](../../index.md)

`InstancePropertyInfo <: Equatable<InstancePropertyInfo> & Hashable & ToString`

描述实例成员属性信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该 InstancePropertyInfo 对应的实例成员属性的注解，返回对应集合。 |
| [`modifiers: Collection<ModifierInfo>`](prop-modifiers.md) | 获取该 InstancePropertyInfo 对应的实例成员属性所拥有的所有修饰符的信息，返回对应集合。 |
| [`name: String`](prop-name.md) | 获取该 InstancePropertyInfo 对应的实例成员属性的名称。 |
| [`typeInfo: TypeInfo`](prop-typeinfo.md) | 获取该 InstancePropertyInfo 对应的实例成员属性的声明类型的类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`findAnnotation<T>(): Option<T> where T <: Annotation`](findannotation.md) | 尝试获取拥有给定限定名称且作用于该对象的注解。 |
| [`getValue(instance: Any): Any`](getvalue.md) | 获取该 InstancePropertyInfo 对应的实例成员属性在给定实例中的值。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该实例成员属性信息的哈希值。 |
| [`isAbstract(): Bool`](isabstract.md) | 判断该 InstancePropertyInfo 对应的实例成员属性是否是抽象的。 |
| [`isMutable(): Bool`](ismutable.md) | 判断该 InstancePropertyInfo 对应的实例成员属性是否可修改。 |
| [`isOpen(): Bool`](isopen.md) | 判断该 InstancePropertyInfo 对应的实例成员属性是否拥有 `open` 语义。 |
| [`setValue(instance: Any, newValue: Any): Unit`](setvalue.md) | 设置该 InstancePropertyInfo 对应的实例成员属性在给定实例中的值。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该实例成员属性信息。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: InstancePropertyInfo): Bool`](operator-ne.md) | 判断该实例成员属性信息与给定的另一个实例成员属性信息是否不等。 |
| [`operator ==(that: InstancePropertyInfo): Bool`](operator-eq.md) | 判断该实例成员属性信息与给定的另一个实例成员属性信息是否相等。 |
