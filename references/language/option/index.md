<!-- cj-doc kind="guide-topic" level="3" id="language.option" parent="language" -->
# Option

[← 语言特性](../index.md)

Some/None、?T、模式解构、??、?.、getOrThrow 与 if-let/while-let。

| 规则/任务 | 摘要 |
|---|---|
| [1. 定义](1-定义.md) | `Some(v)` 表示有值，`None` 表示无值 |
| [2. 简写语法 `?T`](2-简写语法-t.md) | `?Ty` 等价于 `Option<Ty>` |
| [3. 自动包装](3-自动包装.md) | 当上下文期望 `Option<T>` 时，可直接传 `T` 类型的值，编译器自动用 `Some` 包装（不是类型转换）。 |
| [4. 显式 `None<T>`](4-显式-none.md) | 无上下文类型信息时，使用 `None<T>` 显式指定类型。 |
| [5. 解构方式](5-解构方式/index.md) | `e1 ?? e2`：当 `e1` 为 `Some(v)` 时返回 `v`，否则返回 `e2`。 |
| [6. if-let 条件解构](6-if-let-条件解构/index.md) | 在 `if` 条件中使用 `let` 模式匹配语法糖，成功匹配时进入 `if` 分支，绑定的变量仅在 `if` 分支内可用。 |
| [7. while-let 循环解构](7-while-let-循环解构.md) | 在 `while` 条件中使用 `let` 模式，常用于遍历迭代器。 |
| [8. 常见用法总结](8-常见用法总结.md) | 速查`提供默认值`：`??`；`安全访问成员`：`?.`；`条件取值并使用`：`if-let`；另含更多表项。 |
| [9. 完整可运行示例](9-完整可运行示例.md) | 典型 Option 流程包括返回可空结果、用 `if-let` 或 `match` 解构，以及用 `??` 提供默认值。 |
