<!-- cj-doc kind="example-category" level="3" id="examples.cffi" parent="examples" -->
# C 互操作与 unsafe 边界

[← 应用示例](../index.md)

构建和链接本机动态库，管理跨语言数组，并把 foreign 调用限制在显式 unsafe 边界内。

| 示例 | 教学目标 |
|---|---|
| [通过 C FFI 读取并修改数组](native-array.md) | 覆盖本机动态库、[ffi.c]、foreign 声明及 acquire/release 裸数据句柄的完整流程。 |
| [限定 Lambda 中的 foreign 调用边界](unsafe-lambda.md) | Lambda 中的 foreign 调用必须处于词法 unsafe 上下文；优先在 Lambda 内用最小 `unsafe {}` 块，也可由外围 unsafe 函数覆盖定义处。 |
