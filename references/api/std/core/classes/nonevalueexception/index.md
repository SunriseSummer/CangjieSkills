<!-- cj-doc kind="api-type" level="5" id="std.core.class.nonevalueexception" parent="std.core" -->
# NoneValueException

[← std.core](../../index.md)

`NoneValueException <: Exception`

表示 Option<T> 实例的值为 `None` 的异常类，通常在 `getOrThrow` 函数中被抛出。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 NoneValueException 实例，默认异常信息为空。 |
| [`init(message: String)`](init.md) | 根据异常信息构造一个 NoneValueException 实例。 |
