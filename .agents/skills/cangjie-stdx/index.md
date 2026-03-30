---
name: cangjie-stdx
description: "仓颉扩展标准库（stdx）其他包速查：面向切面编程、模糊测试、参数化测试数据加载等"
---

# 仓颉扩展标准库其他包速查

> 以下包为 stdx 中较为专用的功能模块，更常用的功能（HTTP/TLS/JSON/编码/日志/压缩/序列化/加密等）请参阅 `cangjie-stdx` Skill 下的对应专题文档。

---

## 1. stdx.aspectCJ — 面向切面编程（AOP）

提供仓颉中面向切面编程相关的注解能力，通过编译器插件在编译期将切面逻辑织入目标函数：

- **@InsertAtEntry**：在目标函数入口插入指定函数调用。
- **@InsertAtExit**：在目标函数出口插入指定函数调用。
- **@ReplaceFuncBody**：将目标函数体替换为指定函数调用。

需要编译器插件 `libcollect-aspects.so`（收集阶段）和 `libwave-aspects.so`（织入阶段）配合使用。有泛型、可见性、参数类型匹配等约束条件。

---

## 2. stdx.fuzz.fuzz — 模糊测试

提供基于覆盖率反馈的模糊测试（Fuzzing）引擎，用于自动化发现 API 中的潜在缺陷：

- **Fuzzer**：模糊测试引擎，由 `FuzzerBuilder` 构建。
- **FuzzDataProvider**：将变异的字节流转换为标准仓颉类型（Int64、String、Bool、Array\<Byte\> 等），方便编写测试代码。
- **DebugDataProvider**：带调试信息的数据提供者。
- 仅支持 Linux 和 macOS，依赖 LLVM 的 `libclang_rt.fuzzer_no_main.a`。

---

## 3. stdx.unittest.data — 参数化测试数据加载

为参数化单元测试提供外部数据源加载能力，支持从文件加载测试数据并自动反序列化为仓颉对象：

- `json<T>(filePath)` — 从 JSON 文件加载测试数据。
- `csv<T>(filePath, ...)` — 从 CSV 文件加载测试数据（支持自定义分隔符、引号、注释字符等）。
- `tsv<T>(filePath, ...)` — 从 TSV 文件加载测试数据。
- 类型 T 需实现 `Serializable` 接口。
