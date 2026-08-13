<!-- cj-doc kind="api-type" level="5" id="std.unittest.struct.batchinputprovider" parent="std.unittest" -->
# BatchInputProvider<T>

[← std.unittest](../../index.md)

`BatchInputProvider<T> <: BenchInputProvider<T>`

输入提供程序，在执行之前在缓冲区中生成整个基准批次的输入。

## 方法

| 签名 | 功能 |
|---|---|
| [`BatchInputProvider(let builder: () -> T)`](batchinputprovider-t.md) | BatchInputProvider 构造函数。 |
| [`mut get(idx: Int64): T`](get.md) | 获取元素，该函数的执行时间包含在基准测量中，然后作为框架开销计算的一部分从结果中排除。 |
| [`mut reset(max: Int64)`](reset.md) | 在基准测量之前调用。 |
