<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.lazyseq" parent="std.unittest.prop_test" -->
# LazySeq<T>

[← std.unittest.prop_test](../../index.md)

`LazySeq<T> <: Iterable<T>`

延迟计算的 T 类型值序列。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造器。 |
| [`init(element: T)`](init.md) | 构造器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`append(element: T): LazySeq<T>`](append.md) | 增加一个元素。 |
| [`concat(other: LazySeq<T>): LazySeq<T>`](concat.md) | 增加一个序列到此序列中。 |
| [`iterator(): Iterator<T>`](iterator.md) | 实现序列的迭代器。 |
| [`map<U>(body: (T) -> U): LazySeq<U>`](map.md) | 对序列中的每个元素执行闭包处理。 |
| [`mixWith(other: LazySeq<T>): LazySeq<T>`](mixwith.md) | 将新序列穿插进原序列中。 |
| [`prepend(element: T): LazySeq<T>`](prepend.md) | 将新序列插进原序列的开头。 |
| [`static mix(l1: LazySeq<T>, l2: LazySeq<T>): LazySeq<T>`](mix.md) | 两个序列穿插混合成一个。 |
| [`static mix(l1: LazySeq<T>, l2: LazySeq<T>, l3: LazySeq<T>): LazySeq<T>`](mix.md) | 三个序列穿插混合成一个。 |
| [`static mix(l1: LazySeq<T>, l2: LazySeq<T>, l3: LazySeq<T>, l4: LazySeq<T>): LazySeq<T>`](mix.md) | 四个序列穿插混合成一个。 |
| [`static mix(l1: LazySeq<T>, l2: LazySeq<T>, l3: LazySeq<T>, l4: LazySeq<T>, l5: LazySeq<T>): LazySeq<T>`](mix.md) | 五个序列穿插混合成一个。 |
| [`static of(iterable: Iterable<T>): LazySeq<T>`](of.md) | 从迭代器构造一个序列。 |
| [`static of(array: Array<T>): LazySeq<T>`](of.md) | 从数组构造一个序列。 |
