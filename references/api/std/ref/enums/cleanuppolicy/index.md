<!-- cj-doc kind="api-type" level="5" id="std.ref.enum.cleanuppolicy" parent="std.ref" -->
# CleanupPolicy

[← std.ref](../../index.md)

`CleanupPolicy <: Equatable<CleanupPolicy>`

该枚举表示不同的弱引用清理策略，分别为 `EAGER` 和 `DEFERRED`。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`DEFERRED`](value-deferred.md) | 指定 WeakRef 实例的清理策略为 `DEFERRED`，在该清理策略下，GC 会尽可能保证 WeakRef 中的对象存活，只有当可用内存不足时才回收它。 |
| [`EAGER`](value-eager.md) | 指定 WeakRef 实例的清理策略为 `EAGER`，在该清理策略下，GC 会尽快回收 WeakRef 指向的对象，但不能保证其立即回收，也不能保证其一定会被回收。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: CleanupPolicy): Bool`](operator-ne.md) | 对 `Enum CleanupPolicy` 判断是否不等。 |
| [`operator ==(that: CleanupPolicy): Bool`](operator-eq.md) | 对 `Enum CleanupPolicy` 判断是否相等。 |
