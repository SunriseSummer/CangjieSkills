<!-- cj-doc kind="api-package" level="4" id="std.runtime" parent="api.std" -->
# std.runtime

[← std 包索引](../index.md)

控制、管理和监视程序运行时状态。

包路径：`std.runtime`。在代码中只导入实际使用的类型或函数。

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`blackBox<T>(input: T): T`](functions/blackbox-t-t.md) | 指示编译器传入的变量进入优化黑盒，无法进行死代码消除等优化。 |
| [`dumpHeapData(path: Path): Unit`](functions/dumpheapdata-path.md) | 生成堆内存快照信息，写入指定路径的文件。 |
| [`gc(heavy!: Bool = false): Unit`](functions/gc-bool.md) | 执行 gc。 |
| [`getAllocatedHeapSize(): Int64`](functions/getallocatedheapsize.md) | 获取仓颉堆已被使用的大小，单位为 byte。 |
| [`getBlockingThreadCount(): Int64`](functions/getblockingthreadcount.md) | 获取阻塞的仓颉线程数。 |
| [`getGCCount(): Int64`](functions/getgccount.md) | 获取触发 GC 的次数。 |
| [`getGCFreedSize(): Int64`](functions/getgcfreedsize.md) | 获取触发 GC 后，成功回收的内存，单位为 byte。 |
| [`getGCTime(): Int64`](functions/getgctime.md) | 获取触发的 GC 总耗时，单位为 us。 |
| [`getMaxHeapSize(): Int64`](functions/getmaxheapsize.md) | 获取仓颉堆可以使用的最大值，单位为 byte。 |
| [`getNativeThreadCount(): Int64`](functions/getnativethreadcount.md) | 获取物理线程数。 |
| [`getProcessorCount(): Int64`](functions/getprocessorcount.md) | 获取处理器数量。 |
| [`getThreadCount(): Int64`](functions/getthreadcount.md) | 获取仓颉当前的线程数量。 |
| [`getUsedHeapSize(): Int64`](functions/getusedheapsize.md) | 在 Linux 平台下获取仓颉堆实际占用的物理内存大小，单位为 byte。 |
| [`setGCThreshold(value: UInt64): Unit`](functions/setgcthreshold-uint64.md) | 修改用户期望触发 gc 的内存阈值，当仓颉堆大小超过该值时，触发 gc，单位为 KB。 |
| [`startCPUProfiling(): Unit`](functions/startcpuprofiling.md) | 启动 CPU profiler 跟踪。 |
| [`stopCPUProfiling(path: Path): Unit`](functions/stopcpuprofiling-path.md) | 停止 CPU profiler 跟踪，并将记录写入指定路径的文件。 |
