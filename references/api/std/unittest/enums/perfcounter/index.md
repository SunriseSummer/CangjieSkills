<!-- cj-doc kind="api-type" level="5" id="std.unittest.enum.perfcounter" parent="std.unittest" -->
# PerfCounter

[← std.unittest](../../index.md)

`PerfCounter <: ToString`

枚举 Perf 构造器支持的 CPU 计数器。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`HW_CPU_CYCLES`](value-hw_cpu_cycles.md) | 原始 CPU 周期数。 |
| [`HW_INSTRUCTIONS`](value-hw_instructions.md) | 退役的 CPU 指令数量。 |
| [`HW_CACHE_REFERENCES`](value-hw_cache_references.md) | 缓存访问量。 |
| [`HW_CACHE_MISSES`](value-hw_cache_misses.md) | 缓存未命中数量。 |
| [`HW_BRANCH_INSTRUCTIONS`](value-hw_branch_instructions.md) | 退役的分支 CPU 指令数量。 |
| [`HW_BRANCH_MISSES`](value-hw_branch_misses.md) | 分支预测失败的数量。 |
| [`HW_BUS_CYCLES`](value-hw_bus_cycles.md) | 总线周期数。 |
| [`HW_STALLED_CYCLES_FRONTEND`](value-hw_stalled_cycles_frontend.md) | CPU 周期被浪费在 CPU 管道前端阶段的等待上的数量。 |
| [`HW_STALLED_CYCLES_BACKEND`](value-hw_stalled_cycles_backend.md) | CPU 周期被浪费在 CPU 管道后端阶段的等待上的数量。 |
| [`HW_REF_CPU_CYCLES`](value-hw_ref_cpu_cycles.md) | 与频率无关的 CPU 周期数。 |
| [`SW_CPU_CLOCK`](value-sw_cpu_clock.md) | 每个 CPU 时钟时间量。 |
| [`SW_TASK_CLOCK`](value-sw_task_clock.md) | 每个任务的 CPU 时钟时间量。 |
| [`SW_PAGE_FAULTS`](value-sw_page_faults.md) | 页错误数量。 |
| [`SW_CONTEXT_SWITCHES`](value-sw_context_switches.md) | 操作系统上下文切换的数量。 |
| [`SW_CPU_MIGRATIONS`](value-sw_cpu_migrations.md) | CPU 之间的任务迁移量。 |
| [`SW_PAGE_FAULTS_MIN`](value-sw_page_faults_min.md) | 次要页错误数量。 |
| [`SW_PAGE_FAULTS_MAJ`](value-sw_page_faults_maj.md) | 主要页错误数量。 |
| [`SW_EMULATION_FAULTS`](value-sw_emulation_faults.md) | 需要内核模拟的不受支持的指令数量。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 将计数器转换为字符串。 |
