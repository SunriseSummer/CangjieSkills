<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.verifystatement" parent="std.unittest.mock" -->
# VerifyStatement

[← std.unittest.mock](../../index.md)

`VerifyStatement`

此类型表示对“桩签名”在验证范围内的单个验证验证语句（即上文中的“验证语句”），提供了成员函数指定“桩签名”的执行次数。

## 方法

| 签名 | 功能 |
|---|---|
| [`atLeastOnce(): VerifyStatement`](atleastonce.md) | 指定此“验证语句”验证在验证范围内“桩签名”最少被执行一次。 |
| [`atLeastTimes(minTimesExpected: Int64): VerifyStatement`](atleasttimes.md) | 指定此“验证语句”验证在验证范围内“桩签名”最少执行指定的次数。 |
| [`once(): VerifyStatement`](once.md) | 指定此“验证语句”验证在验证范围内“桩签名”仅被执行一次。 |
| [`times(expectedTimes: Int64): VerifyStatement`](times.md) | 指定此“验证语句”验证在验证范围内“桩签名”被执行指定次数。 |
| [`times(min!: Int64, max!: Int64): VerifyStatement`](times.md) | 指定此“验证语句”验证在验证范围内“桩签名”的执行次数在指定范围内。 |
| [`static fromStub<R>( stubCall: () -> R, matchers: Array<ArgumentMatcher>, objName: Option<String>, declarationName: String, callDescription: String, _: Int64 ): VerifyStatement`](fromstub.md) | 构造一个 VerifyStatement。 |
| [`never(): VerifyStatement`](never.md) | 指明这条语句将永远不会被执行。 |
