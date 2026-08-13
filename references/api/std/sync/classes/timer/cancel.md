<!-- cj-doc kind="api-member" level="6" id="std.sync.class.timer.cancel" parent="std.sync.class.timer" -->
# Timer.cancel

[← Timer](index.md)

## 签名

```cangjie role=signature
public func cancel(): Unit
```

取消该 Timer，关联 Task 将不再被调度执行。

## 契约

如果调用该函数时关联 Task 正在执行，不会打断当前运行。该函数不会阻塞当前线程。调用该函数多次等同于只调用一次。
