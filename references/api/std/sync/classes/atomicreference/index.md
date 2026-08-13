<!-- cj-doc kind="api-type" level="5" id="std.sync.class.atomicreference" parent="std.sync" -->
# AtomicReference<T> where T <: Object

[← std.sync](../../index.md)

`AtomicReference<T> where T <: Object`

引用类型原子操作相关函数。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(val: T)`](init.md) | 构造一个封装 `T` 数据类型的原子类型 AtomicReference 的实例，其内部数据初始值为入参 `val` 的值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`compareAndSwap(old: T, new: T): Bool`](compareandswap.md) | CAS 操作，采用默认内存排序方式。 |
| [`load(): T`](load.md) | 读取操作，采用默认内存排序方式，读取原子类型的值。 |
| [`store(val: T): Unit`](store.md) | 写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。 |
| [`swap(val: T): T`](swap.md) | 交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。 |
