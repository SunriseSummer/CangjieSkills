<!-- cj-doc kind="api-type" level="5" id="std.unittest.struct.generateeachinputprovider" parent="std.unittest" -->
# GenerateEachInputProvider<T>

[← std.unittest](../../index.md)

`GenerateEachInputProvider<T> <: BenchInputProvider<T>`

基准输入提供程序，在每次执行基准之前生成输入。

## 方法

| 签名 | 功能 |
|---|---|
| [`GenerateEachInputProvider(let builder: () -> T)`](generateeachinputprovider-t.md) | GenerateEachInputProvider 构造函数。 |
| [`mut get(idx: Int64): T`](get.md) | 获取元素，该函数的执行时间包含在基准测量中，然后作为框架开销计算的一部分从结果中排除。 |
| [`mut reset(max: Int64)`](reset.md) | 在基准测量之前调用。 |
