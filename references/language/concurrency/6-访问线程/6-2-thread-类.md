<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.6-访问线程.6-2-thread-类" parent="language.concurrency.6-访问线程" -->
# 6.2 `Thread` 类

[← 6. 访问线程](index.md)

### 声明
```cangjie cjtest=syntax id=syntax-8fdb5b6e78-1 form=unit
class Thread {
    static prop currentThread: Thread
    prop id: Int64
    prop hasPendingCancellation: Bool
}
```

### 规则
- `Thread` **不能直接实例化**
- 通过 `Future<T>.thread` 或 `Thread.currentThread` 获取
- `id` 是每个线程的唯一整数标识符
