<!-- cj-doc kind="api-type" level="5" id="stdx.fuzz.fuzz.class.fuzzerbuilder" parent="stdx.fuzz.fuzz" -->
# FuzzerBuilder

[← stdx.fuzz.fuzz](../../index.md)

`FuzzerBuilder`

此类用于 Fuzzer 类的构建。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(targetFunction: (Array<UInt8>) -> Int32)`](init.md) | 根据以 UInt8 数组为参数，以 Int32 为返回值的目标函数，创建 FuzzerBuilder 实例。 |
| [`init(targetFunction: (FuzzDataProvider) -> Int32)`](init.md) | 根据以 FuzzDataProvider 为参数，以 Int32 为返回值的目标函数，创建 FuzzerBuilder 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`build(): Fuzzer`](build.md) | 生成一个 Fuzzer 实例。 |
| [`setArgs(args: Array<String>): FuzzerBuilder`](setargs.md) | 设置 Fuzz 运行参数。 |
| [`setTargetFunction(targetFunction: (Array<UInt8>) -> Int32): FuzzerBuilder`](settargetfunction.md) | 设置 Fuzz 目标函数。 |
| [`setTargetFunction(targetFunction: (FuzzDataProvider) -> Int32): FuzzerBuilder`](settargetfunction.md) | 设置 Fuzz 目标函数。 |
