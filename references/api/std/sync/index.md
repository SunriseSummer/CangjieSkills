<!-- cj-doc kind="api-package" level="4" id="std.sync" parent="api.std" -->
# std.sync

[← std 包索引](../index.md)

提供并发编程相关的能力。

包路径：`std.sync`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`AtomicBool`](classes/atomicbool/index.md) | 提供 Bool 类型的原子操作相关函数。 |
| [`AtomicInt16`](classes/atomicint16/index.md) | 提供 Int16 类型的原子操作相关函数。 |
| [`AtomicInt32`](classes/atomicint32/index.md) | 提供 Int32 类型的原子操作相关函数。 |
| [`AtomicInt64`](classes/atomicint64/index.md) | 提供 Int64 类型的原子操作相关函数。 |
| [`AtomicInt8`](classes/atomicint8/index.md) | 提供 Int8 类型的原子操作相关函数。 |
| [`AtomicOptionReference<T> where T <: Object`](classes/atomicoptionreference/index.md) | 提供引用类型原子操作相关函数。 |
| [`AtomicReference<T> where T <: Object`](classes/atomicreference/index.md) | 引用类型原子操作相关函数。 |
| [`AtomicUInt16`](classes/atomicuint16/index.md) | 提供 UInt16 类型的原子操作相关函数。 |
| [`AtomicUInt32`](classes/atomicuint32/index.md) | 提供 UInt32 类型的原子操作相关函数。 |
| [`AtomicUInt64`](classes/atomicuint64/index.md) | 提供 UInt64 类型的原子操作相关函数。 |
| [`AtomicUInt8`](classes/atomicuint8/index.md) | 提供 UInt8 类型的原子操作相关函数。 |
| [`Barrier`](classes/barrier/index.md) | 提供协调多个线程一起执行到某一个程序点的功能。 |
| [`Mutex <: UniqueLock`](classes/mutex/index.md) | 提供可重入互斥锁相关功能。 |
| [`ReadWriteLock`](classes/readwritelock/index.md) | 提供可重入读写锁相关功能。 |
| [`Semaphore`](classes/semaphore/index.md) | 提供信号量相关功能。 |
| [`SyncCounter`](classes/synccounter/index.md) | 提供倒数计数器功能。 |
| [`Timer <: Equatable<Timer> & Hashable`](classes/timer/index.md) | 提供定时器功能。 |
| [`IllegalSynchronizationStateException <: Exception`](classes/illegalsynchronizationstateexception/index.md) | 此类为非法同步状态异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`Condition`](interfaces/condition/index.md) | 提供使线程阻塞并等待来自另一个线程的信号以恢复执行的功能的接口。 |
| [`Lock`](interfaces/lock/index.md) | 提供实现可重入互斥锁的接口。 |
| [`UniqueLock <: Lock`](interfaces/uniquelock/index.md) | 提供实现独占锁的接口。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`CatchupStyle`](enums/catchupstyle/index.md) | 表示不同的重复性任务定时器需要使用的追平策略。 |
