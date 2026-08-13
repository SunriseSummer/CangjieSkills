<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.classtypeinfo" parent="std.reflect" -->
# ClassTypeInfo

[← std.reflect](../../index.md)

`ClassTypeInfo <: TypeInfo`

描述 `class` 类型的类型信息。

## 关键契约

成员集合边界：

- `instanceVariables` 只返回当前类声明的 `public` 实例变量，不包含继承而来的成员；没有符合条件的成员时返回空集合。
- 返回集合不保证遍历顺序恒定。需要确定成员时按 `InstanceVariableInfo.name` 选择，不能把 `toArray()[n]` 当成字段映射。
- 按注解发现字段时遍历集合并调用 `findAnnotation<T>()`；已知名称时直接调用 `getInstanceVariable(name)`。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`constructors: Collection<ConstructorInfo>`](prop-constructors.md) | 获取该 ClassTypeInfo 对应的 `class` 的所有 `public` 构造函数信息，返回对应集合。 |
| [`instanceVariables: Collection<InstanceVariableInfo>`](prop-instancevariables.md) | 获取该 ClassTypeInfo 对应的 `class` 的所有 `public` 实例成员变量信息，返回对应集合。 |
| [`sealedSubclasses: Collection<ClassTypeInfo>`](prop-sealedsubclasses.md) | 如果该 ClassTypeInfo 对应的 `class` 类型拥有 `sealed` 语义，则获取该 `class` 类型所在包内的所有子类的类型信息，返回对应集合。 |
| [`staticVariables: Collection<StaticVariableInfo>`](prop-staticvariables.md) | 获取该 ClassTypeInfo 对应的 `class` 的所有 `public` 静态成员变量信息，返回对应集合。 |
| [`superClass: Option<ClassTypeInfo>`](prop-superclass.md) | 获取该 `class` 类型信息所对应的 `class` 类型的直接父类。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`redef static get(qualifiedName: String): ClassTypeInfo`](get.md) | 获取给定限定名称所对应类型的 ClassTypeInfo。 |
| [`redef static of(a: Any): ClassTypeInfo`](of.md) | 获取给定的任意类型的实例的运行时类型所对应的类型信息。 |
| [`static of(a: Object): ClassTypeInfo`](of.md) | 获取给定的 `class` 类型的实例的运行时类型所对应的 `class` 类型信息。 |
| [`redef static of<T>(): ClassTypeInfo`](of.md) | 获取给定类型 `T` 对应的类型信息。 |
| [`construct(args: Array<Any>): Any`](construct.md) | 在该 ClassTypeInfo 对应的 `class` 类型中根据实参列表搜索匹配的构造函数并调用，传入实参列表，返回调用结果。 |
| [`getConstructor(parameterTypes: Array<TypeInfo>): ConstructorInfo`](getconstructor.md) | 尝试在该 ClassTypeInfo 对应的 `class` 类型中获取与给定形参类型信息列表匹配的 `public` 构造函数的信息。 |
| [`getInstanceVariable(name: String): InstanceVariableInfo`](getinstancevariable.md) | 给定变量名称，尝试获取该 ClassTypeInfo 所对应的 `class` 类型中匹配的实例成员变量的信息。 |
| [`getStaticVariable(name: String): StaticVariableInfo`](getstaticvariable.md) | 给定变量名称，尝试获取该 ClassTypeInfo 所对应的 `class` 类型中匹配的静态成员变量的信息。 |
| [`isAbstract(): Bool`](isabstract.md) | 判断该 ClassTypeInfo 对应的 `class` 类型是否是抽象类。 |
| [`isOpen(): Bool`](isopen.md) | 判断该 ClassTypeInfo 对应的 `class` 类型是否拥有 `open` 语义。 |
| [`isSealed(): Bool`](issealed.md) | 判断该 ClassTypeInfo 对应的 `class` 类型是否拥有 `sealed` 语义。 |
