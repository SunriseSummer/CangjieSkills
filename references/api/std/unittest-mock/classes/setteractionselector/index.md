<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.setteractionselector" parent="std.unittest.mock" -->
# SetterActionSelector<TRet>

[← std.unittest.mock](../../index.md)

`SetterActionSelector<TRet> <: ActionSelector`

此类提供了为属性 `Setter` 函数指定一个操作 API ，并允许链式调用的方法。

## 方法

| 签名 | 功能 |
|---|---|
| [`doesNothing(): CardinalitySelector<SetterActionSelector<TArg>>`](doesnothing.md) | 指定该属性或字段不做任何动作。 |
| [`setsOriginal(): CardinalitySelector<SetterActionSelector<TArg>>`](setsoriginal.md) | 设置原始属性或获取原始实例中的字段值。 |
| [`setsField(field: SyntheticField<TArg>): CardinalitySelector<SetterActionSelector<TArg>>`](setsfield.md) | 设置合成字段。 |
| [`throws(exception: Exception): CardinalitySelector<SetterActionSelector<TArg>>`](throws.md) | 指定抛出异常。 |
| [`throws(exceptionFactory: () -> Exception): CardinalitySelector<SetterActionSelector<TArg>>`](throws.md) | 指定抛出异常。 |
