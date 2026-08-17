# 有界邮箱问题修复

仓颉 `1.1.3 (cjnative)` 可执行包 `bounded_mailbox_fix` 中已有基于并发阻塞队列的有界邮箱，但公开方法仍是占位实现。请在原工程内修复，仅使用标准库，不得重建替代工程。

## 必须保持的公开 API

```cangjie
public class MailboxClosedException <: Exception {
    public init(message: String)
}

public class BoundedMailbox<T> {
    public init(capacity: Int64)
    public prop capacity: Int64
    public func size(): Int64
    public func isClosed(): Bool
    public func send(value: T): Unit
    public func trySend(value: T): Bool
    public func send(value: T, timeout: Duration): Bool
    public func tryReceive(): ?T
    public func receive(timeout: Duration): ?T
    public func drain(): Array<T>
    public func close(): Unit
}
```

## 行为

- capacity 必须大于 0，否则抛 `IllegalArgumentException`。
- `send` 在队列满时阻塞；`trySend` 非阻塞；带 timeout 的 send 最多等待指定时长并返回是否成功。
- `tryReceive` 非阻塞；带 timeout 的 receive 最多等待指定时长，超时返回 None。
- `drain` 按 FIFO 顺序非阻塞取出当前所有项目并返回独立数组。
- `close` 幂等。关闭后所有 send 变体均抛 `MailboxClosedException`；已经入队的元素仍可 receive/drain；队列清空后的 receive 返回 None。
- `size()` 只作为即时观测；公开方法需要正确同步 closed 状态，不能让关闭后的新 send 入队。

`main()` 创建容量 3 的邮箱，发送 `alpha`、`beta`、`gamma`，关闭后 drain，并输出：

```text
alpha,beta,gamma
closed=true
size=0
```

把随题 `bounded_mailbox_test.cj` 原样放入 `src/`。验收要求 `cjpm clean/build/test/run` 全部成功且编译 warning 为 0。
