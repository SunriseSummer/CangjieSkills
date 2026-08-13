<!-- cj-doc kind="api-type" level="5" id="stdx.fuzz.fuzz.class.fuzzer" parent="stdx.fuzz.fuzz" -->
# Fuzzer

[← stdx.fuzz.fuzz](../../index.md)

`Fuzzer`

Fuzzer 类提供了 fuzz 工具的创建。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(targetFunction: (Array<UInt8>) -> Int32)`](init.md) | 根据以 UInt8 数组为参数，以 Int32 为返回值的目标函数，创建 Fuzzer 实例。 |
| [`init(targetFunction: (Array<UInt8>) -> Int32, args: Array<String>)`](init.md) | 根据以 UInt8 数组为参数，以 Int32 为返回值的目标函数，以及 Fuzz 运行参数，创建 Fuzzer 实例。 |
| [`init(targetFunction: (FuzzDataProvider) -> Int32)`](init.md) | 根据以 FuzzDataProvider 为参数，以 Int32 为返回值的目标函数，创建 Fuzzer 实例。 |
| [`init(targetFunction: (FuzzDataProvider) -> Int32, args: Array<String>)`](init.md) | 根据以 FuzzDataProvider 为参数，以 Int32 为返回值的目标函数，以及 Fuzz 运行参数，创建 Fuzzer 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`disableDebugDataProvider(): Unit`](disabledebugdataprovider.md) | 关闭调试信息打印功能，当 FuzzDataProvider.consumeXXX 被调用时，返回值将不被打印到 `stdout`。 |
| [`disableFakeCoverage(): Unit`](disablefakecoverage.md) | 关闭调用 `enableFakeCoverage` 对 Fuzz 的影响。 |
| [`enableDebugDataProvider(): Unit`](enabledebugdataprovider.md) | 启用调试信息打印功能，当 FuzzDataProvider.consumeXXX 被调用时，返回值将被打印到 `stdout`。 |
| [`enableFakeCoverage(): Unit`](enablefakecoverage.md) | 创建一块虚假的覆盖率反馈区域，保持 Fuzz 持续进行。 |
| [`getArgs(): Array<String>`](getargs.md) | 获取 Fuzz 运行参数。 |
| [`setArgs(args: Array<String>): Unit`](setargs.md) | 设置 Fuzz 运行参数。 |
| [`setTargetFunction(targetFunction: (Array<UInt8>) -> Int32): Unit`](settargetfunction.md) | 设置 Fuzz 目标函数。 |
| [`setTargetFunction(targetFunction: (FuzzDataProvider) -> Int32): Unit`](settargetfunction.md) | 设置 Fuzz 目标函数。 |
| [`startFuzz(): Unit`](startfuzz.md) | 执行 Fuzz。 |
