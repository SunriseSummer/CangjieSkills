# 1.1.3 容器流水线与线程快照

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `collection_runtime_113`。将随题提供的 `collection_runtime_113_test.cj` 原样复制到项目 `src/`，测试不可修改。

实现以下公开 API：

```cangjie
public func summarizeEven(values: Array<Int64>): String
public func currentSnapshot(): ThreadSnapshot
```

`summarizeEven` 必须把输入复制到 `ArrayList<Int64>`，直接调用 1.1.3 新增的容器成员 `filter`、`map` 和 `fold`：保留偶数、平方后求和，返回 `count=<偶数数目>;sum=<平方和>`。不得先调用 `iterator()`，不得手写循环代替这三个成员，也不得修改输入数组。

`currentSnapshot` 必须用 `ThreadSnapshot.dumpCurrentThread()` 返回调用线程快照；不得自行拼装替代数据。

`cjpm.toml` 的 `cjc-version` 固定为 `1.1.3`。最终执行 `cjpm clean && cjpm test`（PowerShell 可分两条命令）；所有测试通过且生产源码零 warning。
