<!-- cj-doc kind="example-leaf" level="4" id="examples.concurrency.synchronized-value" parent="examples.concurrency" -->
# 从 synchronized 返回计算值

[← 并发任务与同步](index.md)

把锁保护块作为表达式使用，在自动解锁的同时返回块末尾结果。

## 已验证示例

`synchronized` 既保证锁在正常或异常退出时自动释放，也可返回块的值。共享状态在锁内更新并复制快照，后续处理放到锁外。

```cangjie cjtest=run id=std.synchronized-value.run form=unit timeout=30s
package synchronized_value_example

import std.sync.Mutex

let mutex = Mutex()
var count: Int64 = 0

func addMany(): Unit {
    for (_ in 0..100) {
        synchronized(mutex) {
            count += 1
        }
    }
}

main(): Unit {
    let first = spawn { addMany() }
    let second = spawn { addMany() }
    first.get()
    second.get()

    let snapshot = synchronized(mutex) {
        count
    }
    println(snapshot)
}
```

预期标准输出：

```text cjtest=expect for=std.synchronized-value.run stream=stdout match=exact
200
```
