<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.4-同步机制.4-5-线程局部变量-threadlocal" parent="language.concurrency.4-同步机制" -->
# 4.5 线程局部变量（`ThreadLocal<T>`）

[← 4. 同步机制](index.md)

### 类声明
```cangjie cjtest=syntax id=syntax-c50597c81a-1 form=unit
public class ThreadLocal<T> {
    public init()
    public func get(): Option<T>   // 未设置时返回 None
    public func set(value: Option<T>): Unit  // 传 None 以删除
}
```
- 来自 `core` 包（无需特殊导入）
- 每个线程有独立存储；线程间互不干扰

---
