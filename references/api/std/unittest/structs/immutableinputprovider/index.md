<!-- cj-doc kind="api-type" level="5" id="std.unittest.struct.immutableinputprovider" parent="std.unittest" -->
# ImmutableInputProvider<T>

[← std.unittest](../../index.md)

`ImmutableInputProvider<T> <: BenchInputProvider<T>`

最简单的输入提供程序，只需为基准测试的每次调用复制数据。

## 方法

| 签名 | 功能 |
|---|---|
| [`ImmutableInputProvider(let data: T)`](immutableinputprovider-t.md) | ImmutableInputProvider 构造函数。 |
| [`mut get(idx: Int64): T`](get.md) | 获取元素，该函数的执行时间包含在基准测量中，然后作为框架开销计算的一部分从结果中排除。 |
| [`static createOrExisting(arg: T, x!:Int64=0): ImmutableInputProvider<T>`](createorexisting.md) | 创建或获取一个 ImmutableInputProvider 对象。 |
| [`static createOrExisting<U>(arg: U): U where U <: BenchInputProvider<T>`](createorexisting.md) | 创建或获取一个 BenchInputProvider 的子类型对象。 |
