<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.4-同步机制.4-4-synchronized-关键字" parent="language.concurrency.4-同步机制" -->
# 4.4 `synchronized` 关键字

[← 4. 同步机制](index.md)

`synchronized(lock) { ... }` 在进入代码块时加锁，并在正常返回或异常退出时自动解锁。

### 语法
```cangjie cjtest=syntax id=syntax-ddf64dca7c-1 form=unit
import std.sync.*

main() {
    let mtx = Mutex()
    synchronized(mtx) {
        // 临界区 — 自动加锁/解锁
        println("in critical section")
    }
}
```

### 规则
1. 进入块时自动获取锁
2. 退出时自动释放锁 — 包括通过 `break`、`continue`、`return`、`throw` 退出
3. 可与任何 `Lock` 实例（包括 `Mutex`）一起使用
4. `synchronized` 是一个**表达式**，返回块的值
