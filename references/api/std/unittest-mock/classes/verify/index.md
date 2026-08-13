<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.verify" parent="std.unittest.mock" -->
# Verify

[← std.unittest.mock](../../index.md)

`Verify`

Verify 提供了一系列静态方法来支持定义所需验证的动作，如 `that` 、 `ordered` 以及 `unorder` 。

## 方法

| 签名 | 功能 |
|---|---|
| [`static clearInvocationLog(): Unit`](clearinvocationlog.md) | 清除前序的执行记录，以缩小验证范围。 |
| [`static noInteractions(mocks: Array<Object>): Unit`](nointeractions.md) | 在验证范围内，对象没有任何执行动作时，验证通过。 |
| [`static ordered( collectStatements: (OrderedVerifier) -> Unit): Unit`](ordered.md) | 此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且校验执行顺序。 |
| [`static ordered(statements: Array<VerifyStatement>): Unit`](ordered.md) | 此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且校验执行顺序。 |
| [`static that(statement: VerifyStatement): Unit`](that.md) | 验证是否正确执行了传入的单个“验证语句”。 |
| [`static unordered(collectStatements: (UnorderedVerifier) -> Unit): Unit`](unordered.md) | 此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。 |
| [`static unordered(statements: Array<VerifyStatement>): Unit`](unordered.md) | 此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。 |
| [`static unordered(exhaustive: Exhaustiveness, collectStatements: (UnorderedVerifier) -> Unit): Unit`](unordered.md) | 此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。 |
| [`static unordered(exhaustive: Exhaustiveness, statements: Array<VerifyStatement>): Unit`](unordered.md) | 此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。 |
