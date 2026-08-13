<!-- cj-doc kind="example-category" level="3" id="examples.abstractions" parent="examples" -->
# 接口、泛型与扩展

[← 应用示例](../index.md)

以接口定义能力边界，用泛型约束保证调用契约，并通过扩展复用实现。

| 示例 | 教学目标 |
|---|---|
| [依赖接口实现多态调用](interface-polymorphism.md) | 调用方只依赖接口类型；新增实现无需修改消费函数即可复用同一路径。 |
| [实现 Iterable 与 Iterator](custom-iterator.md) | 实现 iterator/next 契约，让自定义类型自然参与 for-in。 |
| [组合多个泛型接口约束](generic-constraint.md) | 使用 where T <: A & B 暴露实现所需能力，并在编译期拒绝不满足约束的类型。 |
| [为既有类型增加直接扩展](direct-extension.md) | 通过 extend Type 添加不含存储状态的实例成员，并以普通点调用使用。 |
| [用接口扩展声明既有能力](interface-extension.md) | 类型已有所需成员时，以空接口扩展建立能力关系而不重复实现。 |
| [区分具体类型与泛型扩展](generic-extension.md) | 只为特化类型添加专属成员，同时为全部 Box<T> 提供通用扩展。 |
