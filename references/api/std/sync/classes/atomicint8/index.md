<!-- cj-doc kind="api-type" level="5" id="std.sync.class.atomicint8" parent="std.sync" -->
# AtomicInt8

[← std.sync](../../index.md)

`AtomicInt8`

提供 Int8 类型的原子操作相关函数。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(val: Int8)`](init.md) | 构造一个封装 Int8 数据类型的原子类型 AtomicInt8 的实例，其内部数据初始值为入参 `val` 的值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`compareAndSwap(old: Int8, new: Int8): Bool`](compareandswap.md) | CAS 操作，采用默认内存排序方式。 |
| [`fetchAdd(val: Int8): Int8`](fetchadd.md) | 采用默认内存排序方式，将原子类型的值与参数 `val` 进行加操作，将结果写入当前原子类型实例，并返回加操作前的值。 |
| [`fetchAnd(val: Int8): Int8`](fetchand.md) | 采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行与操作。 |
| [`fetchOr(val: Int8): Int8`](fetchor.md) | 采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行或操作。 |
| [`fetchSub(val: Int8): Int8`](fetchsub.md) | 采用默认内存排序方式，以原子类型的值为被减数，参数 `val` 为减数，做减操作。 |
| [`fetchXor(val: Int8): Int8`](fetchxor.md) | 采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行异或操作。 |
| [`load(): Int8`](load.md) | 读取操作，采用默认内存排序方式，读取原子类型的值。 |
| [`store(val: Int8): Unit`](store.md) | 写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。 |
| [`swap(val: Int8): Int8`](swap.md) | 交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。 |
