# 分级双端队列调度器

在仓颉 `1.0.5 (cjnative)` 中创建可执行包 `deque_scheduler`。用 `TreeMap<Int64, ArrayDeque<Job>>` 实现按优先级分桶、桶内双端插入的稳定调度器。

## 公开 API

```cangjie
public class Job {
    public let id: String
    public let priority: Int64
    public init(id: String, priority: Int64)
}

public class DequeScheduler <: Iterable<Job> {
    public init()
    public prop size: Int64
    public func add(job: Job): Unit
    public func addUrgent(job: Job): Unit
    public func take(): ?Job
    public func takeLast(priority: Int64): ?Job
    public func priorities(): Array<Int64>
    public func snapshot(): Array<Job>
    public func iterator(): Iterator<Job>
}
```

数值越小优先级越高。`add` 加到同优先级桶尾，`addUrgent` 加到桶首；`take` 从最小优先级桶首取出；`takeLast` 只从指定桶尾取出。空桶必须从 TreeMap 删除。空调度器/不存在的优先级返回 None。`priorities()` 升序且只含非空桶；`snapshot()` 按优先级、再按桶内从首到尾返回新数组；迭代顺序与 snapshot 一致。

必须直接使用 `ArrayDeque` 的 `addFirst/addLast/removeFirst/removeLast` 和 `TreeMap` 的有序属性，不得用 ArrayList 排序模拟整个结构。

`main()` 输出：

```text
size=4
order=hot,b,a,c
take=hot
remaining=b,a,c
```

把随题测试原样放入 `src/`。验收：`cjpm clean/build/test/run` 全部成功，编译 warning 为 0。
