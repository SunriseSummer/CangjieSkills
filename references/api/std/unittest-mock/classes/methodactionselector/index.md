<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.methodactionselector" parent="std.unittest.mock" -->
# MethodActionSelector<TRet>

[← std.unittest.mock](../../index.md)

`MethodActionSelector<TRet> <: ActionSelector`

此类提供了为成员函数指定一个操作 API ，并允许链式调用。

## 方法

| 签名 | 功能 |
|---|---|
| [`callsOriginal(): CardinalitySelector<MethodActionSelector<TRet>>`](callsoriginal.md) | 定义桩签名执行原始代码逻辑的行为。 |
| [`returns(valueFactory: () -> TRet): CardinalitySelector<MethodActionSelector<TRet>>`](returns.md) | 定义桩签名返回指定的值的行为，该值由传入的闭包生成。 |
| [`returns(value: TRet): CardinalitySelector<MethodActionSelector<TRet>>`](returns.md) | 定义桩签名返回指定值的行为。 |
| [`returnsConsecutively(values: Array<TRet>): Continuation<MethodActionSelector<TRet>>`](returnsconsecutively.md) | 定义桩签名按列表顺序返回指定的值的行为。 |
| [`returnsConsecutively(values: ArrayList<TRet>): Continuation<MethodActionSelector<TRet>>`](returnsconsecutively.md) | 定义桩签名按列表顺序返回指定的值的行为。 |
| [`throws(exceptionFactory: () -> Exception): CardinalitySelector<MethodActionSelector<TRet>>`](throws.md) | 定义桩签名抛出异常的行为，异常由参数闭包函数生成。 |
| [`throws(exception: Exception): CardinalitySelector<MethodActionSelector<TRet>>`](throws.md) | 定义桩签名抛出异常的行为。 |
