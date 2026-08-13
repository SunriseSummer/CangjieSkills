<!-- cj-doc kind="api-package" level="4" id="stdx.fuzz.fuzz" parent="api.stdx" -->
# stdx.fuzz.fuzz

[← stdx 包索引](../index.md)

提供模糊测试输入、覆盖率反馈和运行控制。

包路径：`stdx.fuzz.fuzz`。在代码中只导入实际使用的类型或函数。

## 关键契约

发布件约束：

- 模糊测试运行依赖发布件中的 fuzz 入口与本地库，单有仓颉 API 声明不足以链接。
- stdx 1.0.5.1 的 Windows x64 发布压缩包实测只有 `fuzzFFI.a`，缺少可用的主入口 CJO/库；在该目标上先核对完整工具发布件，否则不要把它纳入可执行方案。

## 类

| 声明 | 功能 |
|---|---|
| [`DebugDataProvider <: FuzzDataProvider`](classes/debugdataprovider/index.md) | 此类继承了 FuzzDataProvider 类型，额外增加了调试信息。 |
| [`Fuzzer`](classes/fuzzer/index.md) | Fuzzer 类提供了 fuzz 工具的创建。 |
| [`FuzzerBuilder`](classes/fuzzerbuilder/index.md) | 此类用于 Fuzzer 类的构建。 |
| [`open FuzzDataProvider`](classes/fuzzdataprovider/index.md) | FuzzDataProvider 是一个工具类，目的是将变异数据的字节流转化为标准的仓颉基本数据。 |
| [`ExhaustedException <: Exception`](classes/exhaustedexception/index.md) | 此异常为转换数据时，剩余数据不足以转换时抛出的异常。 |

## 只读变量

| 声明 | 功能 |
|---|---|
| [`FUZZ_VERSION: String = "1.0.0"`](values/fuzz_version.md) | Fuzz 版本。 |
