# Condition 倒计时门闩

在仓颉 `1.0.5 (cjnative)` 中创建可执行包 `countdown_latch`。使用 `std.sync.Mutex` 及其 `Condition` 实现一次性倒计时门闩，并通过 `spawn/Future` 验证。不得用轮询、sleep 循环、Atomic 替代 Condition 等待。

## 公开 API

```cangjie
public class CountdownLatch {
    public init(count: Int64)
    public prop count: Int64
    public func countDown(): Unit
    public func await(): Unit
    public func await(timeout: Duration): Bool
}
```

初始 count 不得为负。`countDown` 在正数时减一，到零时 `notifyAll`；已经为零时保持零。`await()` 使用谓词循环或 `waitUntil` 抵抗虚假唤醒，直到零返回。带 timeout 的版本在规定时间内到零返回 true，超时返回 false；count 已为零时立即返回 true。读取和更新 count 都必须受同一个 Mutex 保护，调用 wait/notify 时持有绑定锁。

main 创建 count=2 的门闩，启动两个任务分别倒计时，等待后输出：

```text
before=2
opened=true
after=0
```

把随题测试原样放入 `src/`。验收所有 cjpm 命令成功、warning 为 0，测试会重复并发路径检查竞态。
