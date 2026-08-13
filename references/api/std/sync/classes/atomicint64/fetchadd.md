<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint64.fetchadd" parent="std.sync.class.atomicint64" -->
# AtomicInt64.fetchAdd

[← AtomicInt64](index.md)

## 签名

```cangjie role=signature
public func fetchAdd(val: Int64): Int64
```

采用默认内存排序方式，将原子类型的值与参数 `val` 进行加操作，将结果写入当前原子类型实例，并返回加操作前的值。

## 契约

参数：

- val: Int64 - 与原子类型进行加操作的值。

返回值：

- Int64 - 执行加操作前的值。

## 典型示例

`fetchAdd` 原子地写入相加结果，但返回修改前的值；需要新值时再调用 `load()`。

```cangjie cjtest=run id=api.atomic.fetchadd.run form=unit timeout=20s
package atomic_fetchadd_example

import std.sync.*

main(): Unit {
    let counter = AtomicInt64(10)
    println(counter.fetchAdd(5))
    println(counter.load())
}
```

```text cjtest=expect for=api.atomic.fetchadd.run stream=stdout match=exact
10
15
```
