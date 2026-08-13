# 修复并发指标簿

当前目录已有仓颉 `1.0.5 (cjnative)` 可执行包 `metric_book_fix`。它使用 `ConcurrentHashMap<String, AtomicInt64>` 保存按名称计数器，但现有实现把增量写入了错误的原子对象，快照也不满足稳定顺序。请定位并修复生产代码，不要重写或绕过公开 API。

## 必须保持的公开 API

```cangjie
public class MetricBook {
    public init()
    public func record(name: String, delta: Int64): Unit
    public func get(name: String): Int64
    public func total(): Int64
    public func snapshot(): Array<(String, Int64)>
}
```

行为要求：

- `record` 支持正数、负数和 0；同名指标的并发更新不得丢失。
- 首次出现的键只建立一个共享计数器；必须正确理解 `addIfAbsent` 的返回值和 `fetchAdd` 返回旧值的语义。
- `get` 对不存在的键返回 0。
- `total` 返回调用时所有已有计数器值之和。
- `snapshot` 返回调用时的 `(名称, 值)` 快照，按名称升序排列；返回数组不与内部集合共享可变数组存储。
- 测试期间不会在 `total` 或 `snapshot` 遍历的同时写入，重点是写入阶段的并发正确性。

`main()` 的既有输出必须保持：

```text
errors=2
requests=5
total=7
snapshot=errors:2,requests:5
```

根目录测试必须原样复制到 `src/`。依次运行 `cjpm clean/build/test/run`，修正所有错误和 warning；只格式化生产源码。
