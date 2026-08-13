<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.randomdatashrinkerrange" parent="std.unittest.prop_test" -->
# RandomDataShrinkerRange<T>

[← std.unittest.prop_test](../../index.md)

`RandomDataShrinkerRange<T> <: DataShrinker<T> where T <: Comparable<T>`

可按照给定范围生成的数据缩减器。

## 方法

| 签名 | 功能 |
|---|---|
| [`override shrink(value: T): Iterable<T>`](shrink.md) | 将该值缩小为一组可能的“较小”值。 |
