<!-- cj-doc kind="api-type" level="5" id="std.core.class.future" parent="std.core" -->
# Future<T>

[← std.core](../../index.md)

`Future<T>`

Future<T> 实例代表一个仓颉线程任务，可用于获取仓颉线程的计算结果，向仓颉线程发送取消信号。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`thread: Thread`](prop-thread.md) | 获得对应仓颉线程的 Thread 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`cancel(): Unit`](cancel.md) | 给当前 Future 实例对应的仓颉线程发送取消请求。 |
| [`get(): T`](get.md) | 阻塞当前线程，等待并获取当前 Future<T> 对象对应的线程的结果。 |
| [`get(timeout: Duration): T`](get.md) | 阻塞当前线程，等待指定时长并获取当前 Future<T> 对象对应的线程的返回值。 |
| [`tryGet(): Option<T>`](tryget.md) | 尝试获取执行结果，不会阻塞当前线程。 |
