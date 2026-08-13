<!-- cj-doc kind="api-type" level="5" id="std.sync.class.atomicint64" parent="std.sync" -->
# AtomicInt64

[← std.sync](../../index.md)

`AtomicInt64`

提供 Int64 类型的原子操作相关函数。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(val: Int64)`](init.md) | 构造一个封装 Int64 数据类型的原子类型 AtomicInt64 的实例，其内部数据初始值为入参 `val` 的值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`compareAndSwap(old: Int64, new: Int64): Bool`](compareandswap.md) | CAS 操作，采用默认内存排序方式。 |
| [`fetchAdd(val: Int64): Int64`](fetchadd.md) | 采用默认内存排序方式，将原子类型的值与参数 `val` 进行加操作，将结果写入当前原子类型实例，并返回加操作前的值。 |
| [`fetchAnd(val: Int64): Int64`](fetchand.md) | 采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行与操作。 |
| [`fetchOr(val: Int64): Int64`](fetchor.md) | 采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行或操作。 |
| [`fetchSub(val: Int64): Int64`](fetchsub.md) | 采用默认内存排序方式，以原子类型的值为被减数，参数 `val` 为减数，做减操作。 |
| [`fetchXor(val: Int64): Int64`](fetchxor.md) | 采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行异或操作。 |
| [`load(): Int64`](load.md) | 读取操作，采用默认内存排序方式，读取原子类型的值。 |
| [`store(val: Int64): Unit`](store.md) | 写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。 |
| [`swap(val: Int64): Int64`](swap.md) | 交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。 |
