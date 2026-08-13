<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.getteractionselector" parent="std.unittest.mock" -->
# GetterActionSelector<TRet>

[← std.unittest.mock](../../index.md)

`GetterActionSelector<TRet> <: ActionSelector`

此类提供了为属性 `Getter` 函数指定一个操作 API ，并允许链式调用的方法。

## 方法

| 签名 | 功能 |
|---|---|
| [`getsField(field: SyntheticField<TRet>): CardinalitySelector<GetterActionSelector<TRet>>`](getsfield.md) | 读取合成字段。 |
| [`getsOriginal(): CardinalitySelector<GetterActionSelector<TRet>>`](getsoriginal.md) | 读取原始属性或获取原始实例中的字段值。 |
| [`returns(value: TRet): CardinalitySelector<GetterActionSelector<TRet>>`](returns.md) | 指定返回值。 |
| [`returns(valueFactory: () -> TRet): CardinalitySelector<GetterActionSelector<TRet>>`](returns.md) | 指定返回值。 |
| [`returnsConsecutively(values: Array<TRet>): Continuation<GetterActionSelector<TRet>>`](returnsconsecutively.md) | 指定返回多个值。 |
| [`returnsConsecutively(values: ArrayList<TRet>): Continuation<GetterActionSelector<TRet>>`](returnsconsecutively.md) | 指定返回多个值。 |
| [`throws(exception: Exception): CardinalitySelector<GetterActionSelector<TRet>>`](throws.md) | 指定抛出异常。 |
| [`throws(exceptionFactory: () -> Exception): CardinalitySelector<GetterActionSelector<TRet>>`](throws.md) | 指定抛出异常。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend MethodActionSelector<Unit>`](extensions/extend-methodactionselector-unit.md) | 扩展 MethodActionSelector 。 |
