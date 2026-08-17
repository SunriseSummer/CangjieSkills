<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.enumconstructorinfo" parent="std.reflect" -->
# EnumConstructorInfo

[← std.reflect](../../index.md)

`class EnumConstructorInfo <: Equatable<EnumConstructorInfo> & Hashable & ToString`

描述枚举构造子信息，可用于查询构造子参数类型、注解，并根据构造子进行构造/拆解枚举实例。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop annotations: Collection<Annotation>`](prop-annotations.md) | 获取所有作用于该枚举构造子上的注解集合。 |
| [`prop enumTypeInfo: EnumTypeInfo`](prop-enumtypeinfo.md) | 获取该枚举构造子所属枚举类型的 EnumTypeInfo。 |
| [`prop name: String`](prop-name.md) | 获取该枚举构造子的名称（不包含包名前缀）。 |
| [`prop qualifiedName: String`](prop-qualifiedname.md) | 获取该枚举构造子的限定名称。 |
| [`prop parameters: ReadOnlyList<TypeInfo>`](prop-parameters.md) | 获取该枚举构造子的参数类型列表，按声明顺序返回。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static func get(qualifiedName: String): EnumConstructorInfo`](get.md) | 获取给定限定名称所对应的 EnumConstructorInfo。 |
| [`static func of(instance: Any): EnumConstructorInfo`](of.md) | 获取给定枚举实例所属的构造子信息。 |
| [`func apply(args: Array<Any>): Any`](apply.md) | 根据传入的参数列表，构造相应的枚举实例。 |
| [`func getAssociatedValues(instance: Any): ReadOnlyList<Any>`](getassociatedvalues.md) | 获取给定枚举实例的关联值列表。 |
| [`func findAllAnnotations<T>(): Array<T> where T <: Annotation`](findallannotations.md) | 获取该构造子上的所有类型为 `T` 的注解实例。 |
| [`func findAllAnnotation<T>(): ?T where T <: Annotation`](findallannotation.md) | 获取该构造子上的任意一个类型为 `T` 的注解实例。 |
| [`func getAllAnnotations(): Array<Annotation>`](getallannotations.md) | 获取该构造子上的所有注解实例数组。 |
| [`func hashCode(): Int64`](hashcode.md) | 获取该构造子信息的哈希值。 |
| [`func toString(): String`](tostring.md) | 获取该构造子信息的字符串表示，等价于 `qualifiedName`。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator func ==(other: EnumConstructorInfo): Bool`](operator-eq.md) | 判断该构造子信息与另一个构造子信息是否相等。 |

