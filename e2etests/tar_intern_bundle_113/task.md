# 1.1.3 TarGzip 与字符串驻留

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `tar_intern_bundle_113`。将随题提供的 `tar_intern_bundle_113_test.cj` 原样复制到项目 `src/`，测试不可修改。该任务使用与 cjc 1.1.3 匹配的 stdx `1.1.3.1`。

实现以下公开 API：

```cangjie
public func archiveDirectory(source: Path, archive: Path): Unit
public func extractArchive(archive: Path, destination: Path): Unit
public func internLabels(values: Array<String>): Array<String>
```

要求：

- `archiveDirectory` 直接使用 1.1.3 新包 `stdx.compress.TarGzip.archive`，归档目录内容但不保留源目录本身。
- `extractArchive` 直接使用 `TarGzip.extract`，不覆盖目标目录中已存在的同名条目。
- `internLabels` 先用 `String.configInternPool` 配置容量 128、最大字符串长度 256，再逐项调用 `String.intern`；保持元素数量、顺序和文本内容，不去重，不修改输入数组。
- 不得调用外部 `tar`/`gzip` 进程，不得自己实现归档格式，也不得吞掉文件系统、Tar 或 zlib 异常。

先按 Skill 流程配置 stdx，再执行 `cjpm clean && cjpm test`（PowerShell 可分两条命令）；所有测试通过且生产源码零 warning。
