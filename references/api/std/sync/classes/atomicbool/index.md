<!-- cj-doc kind="api-type" level="5" id="std.sync.class.atomicbool" parent="std.sync" -->
# AtomicBool

[← std.sync](../../index.md)

`AtomicBool`

提供 Bool 类型的原子操作相关函数。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(val: Bool)`](init.md) | 构造一个封装 Bool 数据类型的原子类型 AtomicBool 的实例，其内部数据初始值为入参 `val` 的值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`compareAndSwap(old: Bool, new: Bool): Bool`](compareandswap.md) | CAS（Compare and Swap）操作，采用默认内存排序方式。 |
| [`load(): Bool`](load.md) | 读取操作，采用默认内存排序方式，读取原子类型的值。 |
| [`store(val: Bool): Unit`](store.md) | 写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。 |
| [`swap(val: Bool): Bool`](swap.md) | 交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。 |
