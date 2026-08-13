<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.cardinalityselector" parent="std.unittest.mock" -->
# CardinalitySelector<A>

[← std.unittest.mock](../../index.md)

`CardinalitySelector<A> where A <: ActionSelector`

此类提供了可定义桩签名的最近一次行为的执行次数的 API 。

## 方法

| 签名 | 功能 |
|---|---|
| [`anyTimes(): Unit`](anytimes.md) | 定义“桩行为”可以执行任意次数。 |
| [`atLeastOnce(): Unit`](atleastonce.md) | 定义“桩行为”最少被执行一次。 |
| [`atLeastTimes(minTimesExpected: Int64): Unit`](atleasttimes.md) | 定义“桩行为”最少被执行指定次数的行为。 |
| [`once(): Continuation<A>`](once.md) | 定义“桩行为”仅被执行一次。 |
| [`times(expectedTimes: Int64): Continuation<A>`](times.md) | 定义“桩行为”被执行指定次数。 |
| [`times(min!: Int64, max!: Int64): Unit`](times.md) | 定义“桩行为”执行指定次数范围。 |
