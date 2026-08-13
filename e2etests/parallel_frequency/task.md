# 并行词频聚合器

在仓颉 `1.0.5 (cjnative)` 中创建可执行包 `parallel_frequency`。把输入数组按索引分片并行统计词频，输出与调度顺序无关的确定性结果。

实现必须自然使用 `spawn/Future`、`AtomicInt64`、`Mutex`/`synchronized`、`ConcurrentHashMap<String, AtomicInt64>`、普通 `HashMap` 和 `std.sort`。每个输入元素只处理一次；不得先顺序计算结果再启动无意义线程。

## 公开 API

```cangjie
public class FrequencyException <: Exception {
    public init(message: String)
}

public class FrequencyReport {
    public prop total: Int64
    public prop unique: Int64
    public func countOf(word: String): Int64
    public func keys(): Array<String>
    public func render(): String
}

public class ParallelFrequency {
    public static func count(words: Array<String>, workers!: Int64 = 4): FrequencyReport
}
```

`workers <= 0` 抛 `FrequencyException`；工作线程数大于输入数也合法；空输入返回 total/unique 均为 0。词语区分大小写且允许空字符串。`keys()` 返回按仓颉 String 自然顺序升序排列的新数组。`render()` 每行 `key=count`，按 `keys()` 顺序，最后一行后无额外换行；空结果返回空字符串。

`main()` 对 `red blue red green blue red` 使用 3 个 worker，输出：

```text
total=6
unique=3
blue=2
green=1
red=3
```

把随题测试原样放入 `src/`。验收：`cjpm clean/build/test/run` 全部成功，编译 warning 为 0；测试会重复运行以检查竞态。
