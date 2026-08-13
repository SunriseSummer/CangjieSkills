<!-- cj-doc kind="example-category" level="3" id="examples.failure" parent="examples" -->
# 可选值、异常与资源管理

[← 应用示例](../index.md)

用 Option 表达缺失，用异常表达失败，并确保正常与异常路径都释放资源。

| 示例 | 教学目标 |
|---|---|
| [用 Option 问号操作符安全导航](option-navigation.md) | 用 `?.` 在 Some 时继续读取成员、在 None 时短路，再以 `??` 提供同类型默认值。 |
| [利用 Nothing 统一返回与抛出分支](nothing-branch.md) | throw 表达式可与具体返回值组成同一类型的 if 或 match 表达式。 |
| [定义并报告应用异常](custom-exception.md) | 继承 Exception、初始化 message，并按需重写 getClassName 获得稳定类型名。 |
| [在异常路径自动释放资源](try-resource.md) | 实现 Resource 后使用 try(resource)，保证正常和异常路径都执行关闭。 |
