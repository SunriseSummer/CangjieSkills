<!-- cj-doc kind="api-package" level="4" id="stdx.aspectCJ" parent="api.stdx" -->
# stdx.aspectCJ

[← stdx 包索引](../index.md)

提供 AOP 注解，配合编译插件完成函数前后插桩或实现替换。

包路径：`stdx.aspectCJ`。在代码中只导入实际使用的类型或函数。

## 关键契约

发布件约束：

- 该包必须配合 AspectCJ 编译插件工作，仅导入注解不会执行插桩。
- stdx 1.1.3.1 的 Windows x64 发布压缩包实测不含文档所需的 `collect`/`wave` 插件；在该目标上先确认另有匹配插件发布件，否则不要把它纳入可执行方案。

## 类

| 声明 | 功能 |
|---|---|
| [`InsertAtEntry`](classes/insertatentry/index.md) | 在注解所指定方法的入口，织入对被注解标注的函数的调用。 |
| [`InsertAtExit`](classes/insertatexit/index.md) | 在注解所指定方法的退出点，织入对被注解标注的函数的调用。 |
| [`ReplaceFuncBody`](classes/replacefuncbody/index.md) | 将注解所指定方法的方法体，替换为对被注解标注的函数的调用。 |
