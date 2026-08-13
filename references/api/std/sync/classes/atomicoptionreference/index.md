<!-- cj-doc kind="api-type" level="5" id="std.sync.class.atomicoptionreference" parent="std.sync" -->
# AtomicOptionReference<T> where T <: Object

[← std.sync](../../index.md)

`AtomicOptionReference<T> where T <: Object`

提供引用类型原子操作相关函数。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的 AtomicOptionReference 实例。 |
| [`init(val: Option<T>)`](init.md) | 构造一个封装 Option<T> 数据类型的原子类型 AtomicOptionReference 的实例，其内部数据初始值为入参 `val` 的值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`compareAndSwap(old: Option<T>, new: Option<T>): Bool`](compareandswap.md) | CAS 操作，采用默认内存排序方式。 |
| [`load(): Option<T>`](load.md) | 读取操作，采用默认内存排序方式，读取原子类型的值。 |
| [`store(val: Option<T>): Unit`](store.md) | 写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。 |
| [`swap(val: Option<T>): Option<T>`](swap.md) | 交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。 |
