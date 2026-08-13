<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.actionselector" parent="std.unittest.mock" -->
# ActionSelector

[← std.unittest.mock](../../index.md)

`sealed abstract ActionSelector`

此抽象类提供了为成员函数指定一个操作 API ，并允许链式调用的方法。

## 方法

| 签名 | 功能 |
|---|---|
| [`fails(): Unit`](fails.md) | 定义调用桩签名将导致测试失败，执行至桩签名即抛出 AssertionException 异常的行为。 |
