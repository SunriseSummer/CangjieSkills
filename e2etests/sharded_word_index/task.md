# 并发分片词语索引

使用仓颉 `1.1.3 (cjnative)` 创建可执行 cjpm 项目 `sharded_word_index`，仅使用标准库，实现线程安全、可并行批量构建的 Unicode 词语倒排索引。不得修改给定测试。

## 公开 API

```cangjie
public class IndexException <: Exception { public init(message: String) }

public struct WordCount {
    public let word: String
    public let count: Int64
    public init(word: String, count: Int64)
}

public class ShardedWordIndex {
    public let shardCount: Int64
    public init(shardCount: Int64)
    public func add(documentId: String, text: String): Unit
    public func addAll(documents: Array<(String, String)>): Unit
    public func count(word: String): Int64
    public func documents(word: String): Array<String>
    public func top(limit: Int64): Array<WordCount>
    public func totalWords(): Int64
    public func documentCount(): Int64
}
```

## 分词与状态

- 文本按 Rune 遍历。连续 Unicode 字母或数字组成 token；其他字符分隔 token。ASCII 字母转小写；非 ASCII Rune 原样保留。同一规则也用于查询词，查询必须规范化为恰好一个非空 token，否则抛 `IndexException`。
- documentId 裁剪 ASCII 空白后不能为空，且不得重复。`add` 的参数校验和完整分词均成功后才提交状态；失败时所有计数、文档集合和 documentCount 不变。
- 每个 token 的总出现次数均计入；倒排文档 ID 去重并按字典序升序返回。返回数组与内部状态独立。
- `addAll` 要真正使用 `spawn` 将不同文档的分词工作并行化，使用 `Future.get()` 汇合；共享状态必须通过 `Mutex`/`synchronized` 或等价标准同步保证安全。输入为空时无操作。
- `addAll` 发现批次内重复 ID、与已有 ID 重复、非法 ID 或任一分词错误时，整个批次不得提交；不得留下部分文档。可以先并行准备不可变结果，再一次性加锁提交。
- `top(limit)`：limit 小于 0 抛 `IndexException`，0 返回空数组；按 count 降序、word 升序排序。
- `totalWords()` 返回所有 token 出现次数，`documentCount()` 返回成功加入的文档数；所有公开读取支持并发调用。
- `main()` 并行加入内置文档并输出 top 结果以及 `documents=<n> words=<n>`。

## 工程与验收

- 原样复制 `sharded_word_index_test.cj` 到 `src/`，不得修改。
- 生产代码至少拆分 tokenizer、模型、索引实现；禁止伪并发或针对测试常量硬编码。
- 执行 `cjpm build`、`cjpm test --no-color`、`cjpm run`，全部成功且没有 warning。
