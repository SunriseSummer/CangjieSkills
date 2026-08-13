<!-- cj-doc kind="api-member" level="6" id="std.core.class.future.get" parent="std.core.class.future" -->
# Future<T>.get

[← Future<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func get()

### 签名

```cangjie role=signature
public func get(): T
```

阻塞当前线程，等待并获取当前 Future<T> 对象对应的线程的结果。

### 契约

返回值：

- T - 当前 Future\<T> 实例代表的线程运行结束后的返回值。

## func get(Duration)

### 签名

```cangjie role=signature
public func get(timeout: Duration): T
```

阻塞当前线程，等待指定时长并获取当前 Future<T> 对象对应的线程的返回值。

### 契约

需指定等待的超时时间，如果相应的线程在指定时间内未完成执行，则该函数将抛出异常 TimeoutException。如果 timeout <= Duration.Zero，等同于 get()，即不限制等待时长。如果线程抛出异常退出执行，在 get 调用处将继续抛出该异常。

参数：

- timeout: Duration - 等待时间。

返回值：

- T - 返回指定时长后仓颉线程执行结果。

异常：

- TimeoutException - 如果相应的线程在指定时间内未完成执行，则该函数将抛出此异常。
