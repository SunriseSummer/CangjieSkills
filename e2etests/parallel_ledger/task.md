# 并发账户流水账

在仓颉 `1.0.5 (cjnative)` 中创建可执行包 `parallel_ledger`，把账户变更记录分片并行聚合为确定性余额快照。

实现必须自然使用 `spawn/Future`、`ConcurrentHashMap<String, AtomicInt64>`、`AtomicInt64`、`Mutex/synchronized`、普通 `HashMap`、`ArrayList` 和 `std.sort`。每条变更记录只能处理一次；不得先顺序计算结果再启动无意义线程，也不得依赖并发容器的迭代顺序。

## 公开 API

```cangjie
public struct LedgerChange {
    public let account: String
    public let delta: Int64
    public init(account: String, delta: Int64)
}

public class LedgerException <: Exception {
    public init(message: String)
}

public class LedgerSnapshot {
    public prop processed: Int64
    public prop accountCount: Int64
    public func balanceOf(account: String): Int64
    public func accounts(): Array<String>
    public func entries(): Array<(String, Int64)>
    public func render(): String
}

public class ParallelLedger {
    public static func aggregate(changes: Array<LedgerChange>, workers!: Int64 = 4): LedgerSnapshot
}
```

语义：

- `workers <= 0` 抛 `LedgerException`；worker 多于记录数合法；空输入返回空快照。
- 账户名区分大小写，允许空字符串；余额允许为负数或零。
- 记录按输入索引分片并行处理，每条记录恰好一次；用原子计数验证处理总数。
- 完成全部 `Future` 后，把并发数据复制到普通 `HashMap`，之后快照不得依赖或暴露可变并发状态。
- `balanceOf` 对不存在账户返回 0。
- `accounts()` 返回按 `String` 自然顺序升序的新数组。
- `entries()` 顺序与 `accounts()` 一致，每次返回新数组。
- `render()` 每行 `account=balance`，最后无额外换行；空快照返回空字符串。

把随题 `parallel_ledger_test.cj` 原样放入 `src/`。`main()` 使用 3 个 worker 聚合 `alice:+5, bob:+3, alice:-2, carol:+7` 并输出：

```text
processed=4
accounts=3
alice=3
bob=3
carol=7
```

验收要求 `cjpm clean/build/test/run` 全部成功，24 项测试全部通过且重复执行稳定，编译 warning 为 0。
