<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjprof.3-堆内存分析.3-1-导出堆内存-dump" parent="tools.cjprof.3-堆内存分析" -->
# 3.1 导出堆内存（dump）

[← 3. 堆内存分析](index.md)

```bash
cjprof heap -d 12345 -o heap.data      # 导出进程 12345 的堆内存
```

> 导出会向进程发送 `SIG_USR1` 信号，需确认目标为仓颉程序。导出时运行目录和程序目录均需写权限。
