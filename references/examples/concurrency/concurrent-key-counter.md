<!-- cj-doc kind="example-leaf" level="4" id="examples.concurrency.concurrent-key-counter" parent="examples.concurrency" -->
# 组合并发映射与原子计数器

[← 并发任务与同步](index.md)

用 `ConcurrentHashMap<K, AtomicInt64>` 建立按键原子计数器：`addIfAbsent` 只负责唯一初始化，后续增量由共享 Atomic 实例完成。

## 典型示例

并发映射只保证映射操作安全；把普通整数取出、相加、写回仍会丢更新。按键计数时，让映射保存 `AtomicInt64`：每次先创建候选值，`addIfAbsent` 返回已有实例时复用它，返回 `None` 时使用自己的候选实例，随后只对选中的同一个原子对象调用 `fetchAdd`。

```cangjie cjtest=run id=std.concurrent-key-counter.run form=unit timeout=20s
package concurrent_key_counter_example

import std.collection.concurrent.*
import std.sync.*

class ConcurrentKeyCounter {
    private let values = ConcurrentHashMap<String, AtomicInt64>()

    func add(key: String, delta: Int64): Unit {
        let candidate = AtomicInt64(0)
        let counter = values.addIfAbsent(key, candidate) ?? candidate
        counter.fetchAdd(delta)
    }

    func get(key: String): Int64 {
        match (values.get(key)) {
            case Some(counter) => counter.load()
            case None => 0
        }
    }
}

main(): Unit {
    let counter = ConcurrentKeyCounter()
    let left = spawn {
        for (_ in 0..1000) { counter.add("requests", 1) }
    }
    let right = spawn {
        for (_ in 0..1000) { counter.add("requests", 1) }
    }
    left.get()
    right.get()
    println(counter.get("requests"))
}
```

预期标准输出：

```text cjtest=expect for=std.concurrent-key-counter.run stream=stdout match=exact
2000
```
