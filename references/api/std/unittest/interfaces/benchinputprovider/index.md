<!-- cj-doc kind="api-type" level="5" id="std.unittest.interface.benchinputprovider" parent="std.unittest" -->
# BenchInputProvider

[← std.unittest](../../index.md)

`BenchInputProvider<T> <: BenchmarkInputMarker`

当某些代码需要在性能测试执行前执行，或当输入变化就需要重新执行一段代码时，可实现本接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`mut get(idx: Int64): T`](get.md) | 获取元素。 |
| [`mut reset(max: Int64)`](reset.md) | 在基准测量之前调用。 |
