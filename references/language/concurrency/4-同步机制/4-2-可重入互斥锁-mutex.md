<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.4-同步机制.4-2-可重入互斥锁-mutex" parent="language.concurrency.4-同步机制" -->
# 4.2 可重入互斥锁（`Mutex`）

[← 4. 同步机制](index.md)

`Mutex` 保护共享数据；同一线程可重复加锁，但每次加锁都必须对应一次解锁。

### 类声明
```cangjie cjtest=syntax id=syntax-5566e07fe7-1 form=unit
public class Mutex <: UniqueLock {
    public init()
    public func lock(): Unit
    public func unlock(): Unit
    public func tryLock(): Bool
    public func condition(): Condition
}
```

### 规则
1. 访问共享数据前**须获取锁**
2. 完成后**须释放锁**
3. **可重入**：已持有 Mutex 的线程可再次获取而不死锁
4. `unlock()` 次数须与 `lock()` 次数匹配才能完全释放
5. 未持有锁时调用 `unlock()` 抛出 `IllegalSynchronizationStateException`
6. `tryLock()` 返回 `Bool` — 不保证获取锁；须检查返回值
