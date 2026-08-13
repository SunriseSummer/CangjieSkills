<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.interface.datashrinker" parent="std.unittest.common" -->
# DataShrinker<T>

[← std.unittest.common](../../index.md)

`DataShrinker<T>`

DataStrategy 的组件，用于在测试期间缩减数据，T 指定该收缩器处理的数据类型。

## 方法

| 签名 | 功能 |
|---|---|
| [`shrink(value: T): Iterable<T>`](shrink.md) | 获取类型 T 的值并生成较小值的集合。 |
