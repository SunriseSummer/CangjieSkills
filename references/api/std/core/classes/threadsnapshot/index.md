<!-- cj-doc kind="api-type" level="5" id="std.core.class.threadsnapshot" parent="std.core" -->
# ThreadSnapshot

[← std.core](../../index.md)

`class ThreadSnapshot <: ToString`

获取当前线程或者所有线程的信息，包含名称、id、状态、调用栈。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`let id: Int64`](field-id.md) | 获取线程的 id。 |
| [`let name: String`](field-name.md) | 获取线程的名称。 |
| [`let stackTrace: Array<StackTraceElement>`](field-stacktrace.md) | 获取线程的调用栈信息。 |
| [`let state: ThreadState`](field-state.md) | 获取线程的状态。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static func dumpAllThreads(): Array<ThreadSnapshot>`](dumpallthreads.md) | 获取当前进程中所有线程的信息。 |
| [`static func dumpCurrentThread(): ThreadSnapshot`](dumpcurrentthread.md) | 获取当前线程的信息。 |
| [`func toString(): String`](tostring.md) | 获取 ThreadSnapshot 对象的字符串表示。 |

