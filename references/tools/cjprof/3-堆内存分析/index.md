<!-- cj-doc kind="guide-index" level="4" id="tools.cjprof.3-堆内存分析" parent="tools.cjprof" -->
# 3. 堆内存分析

[← cjprof 性能分析](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 导出堆内存（dump）](3-1-导出堆内存-dump.md) | 导出会向进程发送 `SIG_USR1` 信号，需确认目标为仓颉程序。 |
| [3.2 分析对象信息](3-2-分析对象信息.md) | 输出各对象类型的实例数、浅堆大小、深堆大小。 |
| [3.3 查看仓颉线程栈](3-3-查看仓颉线程栈.md) | 命令：`cjprof heap --show-thread`。 |
| [3.4 查看对象引用关系](3-4-查看对象引用关系.md) | 命令：`cjprof heap --show-reference="AAA;BBB"`。 |
| [3.5 堆分析选项](3-5-堆分析选项.md) | 速查`-d` / `--dump <pid>`：导出指定进程的堆内存；`-i` / `--input <file>`：分析的堆数据文件（默认 `cjprof.data`）；`-o` / `--output <file>`：导出的堆数据文件（默认 `cjprof.data`）；另含更多表项。 |
