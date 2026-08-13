<!-- cj-doc kind="api-type" level="5" id="std.core.class.thread" parent="std.core" -->
# Thread

[← std.core](../../index.md)

`Thread`

获取线程 ID 及名字、查询线程是否存在取消请求、注册线程未处理异常的处理函数等。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`static currentThread: Thread`](prop-currentthread.md) | 获取当前执行线程的 Thread 对象。 |
| [`hasPendingCancellation: Bool`](prop-haspendingcancellation.md) | 线程是否存在取消请求，即是否通过 future.cancel() 发送过取消请求，常见使用方为 Thread.currentThread.hasPendingCancellation。 |
| [`id: Int64`](prop-id.md) | 获取当前执行线程的标识，以 Int64 表示，所有存活的线程都有不同标识，但不保证当线程执行结束后复用它的标识。 |
| [`mut name: String`](prop-name.md) | 获取或设置线程的名称，获取设置都具有原子性。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static handleUncaughtExceptionBy(exHandler: (Thread, Exception) -> Unit): Unit`](handleuncaughtexceptionby.md) | 注册线程未处理异常的处理函数。 |
