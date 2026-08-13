<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.5-终止线程.5-2-synccounter" parent="language.concurrency.5-终止线程" -->
# 5.2 `SyncCounter`

[← 5. 终止线程](index.md)

- 用于线程协调：`SyncCounter(n)`，配合 `dec()` 和 `waitUntilZero()` 使用
- 来自 `std.sync` 包
```cangjie cjtest=syntax id=syntax-21116107c8-1 form=unit
import std.sync.*

main() {
    let counter = SyncCounter(3)
    for (i in 0..3) {
        spawn { =>
            // 执行工作...
            counter.dec()     // 完成后计数减 1
        }
    }
    counter.waitUntilZero()   // 等待所有线程完成
}
```

---
