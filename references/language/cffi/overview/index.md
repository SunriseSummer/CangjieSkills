<!-- cj-doc kind="guide-index" level="4" id="language.cffi.overview" parent="language.cffi" -->
# 总览与通用规则

[← C 互操作](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [1. 从仓颉调用 C](1-从仓颉调用-c/index.md) | 使用 `@C` 和 `foreign` 修饰符，结合仓颉函数语法声明 C 函数，`@C` 修饰符可省略。 |
| [2. 类型映射](2-类型映射/index.md) | 注意： C 的 `int`、`long` 等类型在不同平台大小不同，需自行指定对应仓颉类型。 |
| [3. 内存管理](3-内存管理/index.md) | 注意： `acquireArrayRawData` 和 `releaseArrayRawData` 必须配对使用。 |
| [4. C 调用仓颉](4-c-调用仓颉.md) | `foreign` 和 `@C` 函数的命名不建议使用 `CJ_`（不区分大小写）前缀，避免与编译器内部符号冲突 |
| [5. 编译构建](5-编译构建.md) | 编译构建指导请查阅 `./build/README.md`，包括仓颉 C 互操作项目的配置/构建/运行方法（涵盖动态库、静态库及不同平台的使用指导） |
| [6. 完整示例](6-完整示例/index.md) | 完整的编译构建命令请参考 CFFI 构建。 |
| [7. 使用约束](7-使用约束.md) | 线程局部变量：仓颉线程可能被调度到不同 OS 线程，使用 C 的 `thread_local` 或 `pthread_key_create` 变量有风险 |
