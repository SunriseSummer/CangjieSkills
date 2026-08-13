# 仓颉并发任务调度与分层缓存任务书

## 1. 目标

使用仓颉 1.0.5 实现一个固定 worker 数的并发任务调度器、强缓存、显式可控的弱引用缓存和有界对象复用池，并提供稳定的运行时快照接口。

核心实现应覆盖：

- `std.collection.concurrent.ConcurrentHashMap` 与 `ArrayBlockingQueue`；
- `std.sync` 的原子类型、互斥同步和/或 `SyncCounter`；
- `std.ref.WeakRef` 与 `CleanupPolicy`；
- `std.runtime` 的非 deprecated 统计函数、`blackBox` 和 `gc`；
- 类、接口、`Option`、自定义异常与 `Resource`。

`std.objectpool.ObjectPool` 在 1.0.5 已标记 deprecated，直接使用会产生编译 warning，与本任务 0 warning 门禁冲突。因此不得屏蔽 deprecated warning；本任务以 `ArrayBlockingQueue` 实现 `ReusableBufferPool`，验证相邻且可长期使用的对象复用能力。

## 2. 工程结构

```text
concurrent_cache_scheduler/
├── cjpm.toml
└── src/
    ├── main.cj
    ├── scheduler.cj
    └── concurrent_cache_scheduler_test.cj  # 已给定，不可修改
```

包名与项目名均为 `concurrent_cache_scheduler`，`cjc-version = "1.0.5"`，输出类型为 `executable`。

## 3. 调度器公开 API

```cangjie
public class SchedulerException <: Exception {
    public init(message: String)
}

public interface SchedulerTask {
    prop cacheKey: String
    func execute(): String
}

public class LiteralTask <: SchedulerTask {
    public init(key: String, result: String)
}

public class FailingTask <: SchedulerTask {
    public init(key: String, reason: String)
}

public class TaskHandle {
    public init()
    public func get(): String
}

public struct SchedulerStats {
    public let submitted: Int64
    public let executed: Int64
    public let cacheHits: Int64
}
```

- `LiteralTask.execute()` 返回构造时的 result。
- `FailingTask.execute()` 抛出带 reason 的 `SchedulerException`。
- `TaskHandle.get()` 等待任务完成；失败任务以 `SchedulerException` 向调用者报告原异常消息。

```cangjie
public class TaskScheduler <: Resource {
    public let workerCount: Int64
    public let queueCapacity: Int64
    public init(workerCount: Int64, queueCapacity: Int64)
    public func submit(task: SchedulerTask): TaskHandle
    public func cached(key: String): ?String
    public func invalidate(key: String): ?String
    public prop cacheSize: Int64
    public func stats(): SchedulerStats
    public func isClosed(): Bool
    public func close(): Unit
}
```

契约：

1. workerCount/queueCapacity 必须为正，否则抛 `SchedulerException`。
2. 构造时启动固定数量 worker，从有界阻塞队列取任务。
3. worker 执行前查询 `ConcurrentHashMap<String, String>`；命中时直接完成 handle 并增加 cacheHits，未命中才执行并缓存成功结果。失败结果不缓存。
4. 空 cacheKey、关闭后 submit 均抛 `SchedulerException`。
5. `submitted` 统计被接受入队的提交；`executed` 只统计真正成功执行的任务；`cacheHits` 只统计命中。
6. `invalidate` 返回旧值 Option。任务不要求同 key 的 single-flight；测试会在前一结果完成后再验证缓存命中。
7. `close` 拒绝新任务，排空先前已入队任务，停止并等待全部 worker；可重复调用。

## 4. 弱引用缓存与复用池 API

```cangjie
public class CacheValue {
    public let text: String
    public init(text: String)
}

public class WeakValueCache {
    public init()
    public func put(key: String, value: CacheValue, policy: CleanupPolicy): Unit
    public func get(key: String): ?CacheValue
    public func policy(key: String): ?CleanupPolicy
    public func clearReferent(key: String): Bool
    public func remove(key: String): Bool
    public prop size: Int64
}
```

内部映射使用 `ConcurrentHashMap<String, WeakRef<CacheValue>>`。测试在 get 前持有强引用，不以 GC 时机断言；清空行为只用 `WeakRef.clear()` 验证，因此确定可复现。

```cangjie
public class ReusableBuffer {
    public var text: String
    public init()
    public func reset(): Unit
}

public class ReusableBufferPool {
    public let capacity: Int64
    public init(capacity: Int64)
    public func acquire(): ReusableBuffer
    public func release(buffer: ReusableBuffer): Bool
    public prop available: Int64
    public prop created: Int64
}
```

- capacity 必须为正，否则抛 `SchedulerException`。
- `acquire` 优先 `tryRemove`，池空时新建并增加 created。
- `release` 先 reset，再 `tryAdd`；池满返回 false，不阻塞。

## 5. runtime API

```cangjie
public struct RuntimeSnapshot {
    public let processors: Int64
    public let threads: Int64
    public let nativeThreads: Int64
    public let blockingThreads: Int64
    public let allocatedHeap: Int64
    public let usedHeap: Int64
    public let maxHeap: Int64
    public let gcCount: Int64
}

public func captureRuntime(): RuntimeSnapshot
public func runtimeIdentity<T>(value: T): T
public func requestGc(heavy: Bool): Unit
```

- 分别调用 1.0.5 的 `getProcessorCount/getThreadCount/getNativeThreadCount/getBlockingThreadCount/getAllocatedHeapSize/getUsedHeapSize/getMaxHeapSize/getGCCount`。
- `runtimeIdentity` 通过 `blackBox` 返回原值。
- `requestGc` 调用小写、非 deprecated 的 `gc(heavy: ...)`。
- 测试只检查跨平台稳定的不变量，不断言瞬时线程数、堆大小或 GC 增量的精确值。

## 6. main 与验收

main 用两个 worker 演示同 key 的第二次提交命中缓存，稳定输出：

```text
computed,computed; executed=1; hits=1
```

将冻结的 `concurrent_cache_scheduler_test.cj` 原样放入 `src/`。它包含 32 个测试。最终执行：

```text
cjpm clean
cjpm build
cjpm test --no-color
cjpm run
```

四条命令均须成功，32/32 测试通过，编译器 warning 为 0。不得访问设计目录中的 oracle。

