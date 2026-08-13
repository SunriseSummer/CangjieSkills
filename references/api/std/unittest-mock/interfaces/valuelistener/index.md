<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.interface.valuelistener" parent="std.unittest.mock" -->
# ValueListener<T>

[← std.unittest.mock](../../index.md)

`ValueListener<T>`

此接口提供了多个成员函数以支持“监听”传入给桩签名的参数。

## 方法

| 签名 | 功能 |
|---|---|
| [`addCallback(callback: (T) -> Unit): Unit`](addcallback.md) | 为当前“值监听器”对象增加闭包函数，该函数将处理传入的参数值。 |
| [`allValues(): Array<T>`](allvalues.md) | 返回当前“值监听器”对象已所处理的所有值。 |
| [`lastValue(): Option<T>`](lastvalue.md) | 返回当前“值监听器”对象所处理的最后一个值。 |
| [`static new(): ValueListener<T>`](new.md) | 创建一个新的“值监听器”对象，不包含任何处理参数的闭包方法。 |
| [`static onEach(callback: (T) -> Unit): ValueListener<T>`](oneach.md) | 创建一个新的“值监听器”对象，带有一个处理参数的闭包方法。 |
