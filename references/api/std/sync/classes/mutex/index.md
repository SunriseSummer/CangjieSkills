<!-- cj-doc kind="api-type" level="5" id="std.sync.class.mutex" parent="std.sync" -->
# Mutex

[← std.sync](../../index.md)

`Mutex <: UniqueLock`

提供可重入互斥锁相关功能。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建可重入互斥锁。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`condition(): Condition`](condition.md) | 仅在当前线程已持有该 `Mutex` 时创建关联 `Condition`；否则抛出 `IllegalSynchronizationStateException`。 |
| [`lock(): Unit`](lock.md) | 锁定互斥体，如果互斥体已被锁定，则阻塞。 |
| [`tryLock(): Bool`](trylock.md) | 尝试锁定互斥体。 |
| [`unlock(): Unit`](unlock.md) | 解锁互斥体。 |
