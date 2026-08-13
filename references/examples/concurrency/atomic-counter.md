<!-- cj-doc kind="example-leaf" level="4" id="examples.concurrency.atomic-counter" parent="examples.concurrency" -->
# 用 AtomicInt64 累加计数

[← 并发任务与同步](index.md)

以 fetchAdd 原子更新，并根据返回的旧值推导更新后状态。

## 典型示例

`fetchAdd` 原子地写入相加结果，但返回修改前的值；需要新值时再调用 `load()`。

```cangjie cjtest=run id=examples.concurrency.atomic-counter.api.atomic.fetchadd.run form=unit timeout=20s
package atomic_fetchadd_example

import std.sync.*

main(): Unit {
    let counter = AtomicInt64(10)
    println(counter.fetchAdd(5))
    println(counter.load())
}
```

预期标准输出：

```text cjtest=expect for=examples.concurrency.atomic-counter.api.atomic.fetchadd.run stream=stdout match=exact
10
15
```
