<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.6-访问线程.6-1-future-线程句柄" parent="language.concurrency.6-访问线程" -->
# 6.1 `Future<T>` — 线程句柄

[← 6. 访问线程](index.md)

### 类声明
```cangjie cjtest=syntax id=syntax-89af3704e3-1 form=unit
public class Future<T> {
    public prop thread: Thread               // 获取关联的 Thread 对象
    public func get(): T
    public func get(timeout: Duration): T
    public func tryGet(): Option<T>
    public func cancel(): Unit               // 发送取消请求
}
```

### 返回类型
- `spawn` 返回 `Future<T>`，其中 `T` 匹配 Lambda 返回类型

### 方法
| 方法 | 行为 |
|------|------|
| `thread` | 获取与此 Future 关联的 `Thread` 对象 |
| `get()` | 阻塞直到线程完成；返回结果。重新抛出线程中的异常 |
| `get(timeout)` | 带超时阻塞；超时抛出 `TimeoutException`。若 `timeout <= Duration.Zero`，行为同 `get()` |
| `tryGet()` | 非阻塞；线程未完成时返回 `Option<T>.None`；重新抛出异常 |
| `cancel()` | 发送协作式取消请求（不强制停止线程） |

### 关键规则
- `get()` 的位置决定并发性：放在其他工作前串行化执行；放在之后允许并行
