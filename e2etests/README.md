# 仓颉 AI Coding 端到端测试集

本目录收录 62 个经过实际 Agent 开发和仓颉工具链验证的任务，用于持续观察 Skill 对开发正确性、知识查询效率、修正轮次、工具调用和 token 开销的影响。任务覆盖从零开发、增量开发和问题修复，知识面横跨语言特性、std/stdx API、宏、AST、反射、并发、网络、文件、二进制、密码学、C FFI 与工具链。

## 使用方法

1. 复制一个任务目录到隔离工作区；不要直接在本测试集内开发。
2. 仅向 Agent 提供该目录、待测 Skill 和任务书要求的本机工具；不要提供实验报告或参考实现。
3. 要求 Agent 完整阅读 `task.md`，不得修改随题测试、fixture、seed、`frozen/**`、哈希清单或验收脚本。
4. 对基础任务，把 `*_test.cj` 原样放入项目 `src/`；对带 `seed/` 的任务，以 seed 为初始工程；对带 `accept.py` 的任务，按任务书执行最终验收。
5. 至少记录最终通过情况、warning、模型请求/轮次、输入/输出 token、工具调用、知识查询进程及内部查询数、返回字符、失败构建、源码修正轮次和墙钟时间。同一条件重复执行时取均值或报告分布。

复制或提交前运行 `python validate.py`，校验任务数量、README 收录、冻结哈希、Python 语法/规模，以及参考工程、构建产物和平台专属脚本未混入测试集。

`oracle`、golden、历史 Agent 输出、trace 和构建产物均不属于测试输入，已从本目录排除。`.gitignore` 只忽略任务执行产生的本地构建与缓存，不忽略任务书、测试、seed、fixture 或验收资产。

## 新建项目

### 基础语言、建模与文本处理

| 目录 | 简介 |
|---|---|
| `json_parser` | 从零实现 JSON 类型树、递归下降解析和序列化。 |
| `mustache` | 实现变量、区块、反向区块、转义与上下文查找的模板引擎。 |
| `shape_analytics` | 使用接口、类、结构体、枚举、泛型和集合完成图形分析。 |
| `source_metrics` | 基于 `std.ast`、Visitor 和类型模式统计仓颉源码指标。 |
| `reflect_mapper` | 使用注解、反射、泛型解码器和校验规则完成对象映射。 |
| `workspace_rule_pipeline` | 构建多模块 workspace、public import 门面和泛型规则流水线。 |
| `unicode_label_registry` | 使用 Rune 分类、Unicode 大小写、集合和稳定去重管理标签。 |
| `unicode_lexer` | 使用 Rune、模式匹配和自动派生实现 Unicode 词法器。 |
| `unicode_concordance` | 构建 Unicode 词语索引、行号集合和确定性报告。 |
| `typed_policy_chain` | 覆盖抽象类、接口、泛型约束、自定义迭代器和下标运算符。 |
| `rule_registry` | 实现可组合规则、泛型注册表、稳定排序和异常契约。 |
| `annotated_registry` | 结合注解、反射、弱引用、Option 与确定性清理构建注册表。 |
| `command_router` | 实现路由优先级、闭包 Handler、中间件链和异常恢复。 |
| `scoreboard` | 解析构建记录，按项目聚合并生成稳定质量排行榜。 |
| `event_rollup` | 使用枚举、模式匹配、HashMap 和自定义排序汇总事件。 |
| `layered_config` | 合并分层类型化配置，覆盖元组解构、集合遍历和优先级。 |
| `effect_handler_113` | 使用 1.1.3 实验性 Command、perform、handle、resume 与默认实现构建可恢复配置读取。 |
| `reflection_shape_codec_113` | 使用新增枚举构造子、元组与函数 TypeInfo 完成动态构造、拆解和调用。 |

### 集合、并发与资源生命周期

| 目录 | 简介 |
|---|---|
| `concurrent_cache_scheduler` | 组合有界队列、并发映射、原子量、弱引用和 Resource。 |
| `countdown_latch` | 基于 Mutex、Condition、Duration 和 Future 实现倒计时门闩。 |
| `parallel_frequency` | 多任务并行统计词频并确定性合并结果。 |
| `deque_scheduler` | 使用 ArrayDeque、优先级与公平策略构建调度器。 |
| `parallel_ledger` | 并发聚合账户变更，覆盖共享状态、原子计数和稳定快照。 |
| `sharded_word_index` | 使用 spawn/Future、Mutex 和原子提交实现分片索引。 |
| `collection_runtime_113` | 使用 1.1.3 容器直连 filter/map/fold 与 ThreadSnapshot 构建可验证流水线。 |

### 数值、二进制与数据格式

| 目录 | 简介 |
|---|---|
| `exact_share_allocator` | 使用 Decimal、BigInt、舍入和稳定最大余数法分配份额。 |
| `decimal_invoice` | 精确解析、计算和舍入 Decimal 账单。 |
| `endian_journal` | 读写混合端序遥测记录并处理损坏输入。 |
| `binary_frame_archive` | 组合端序、溢出检查、摘要、压缩和文件 I/O 实现归档格式。 |
| `streaming_json_migrator` | 使用 stdx JsonReader/Writer 流式迁移 JSON 文档。 |
| `json_catalog` | 使用 stdx serialization 与 `DataModelSeq` 完成 JSON 往返。 |
| `json_config` | 用 stdx JSON 解析并归一化配置，覆盖缺失、类型和语法错误。 |
| `sha256_lines` | 逐行计算 SHA-256 并输出小写十六进制清单。 |
| `zlib_roundtrip` | 使用 zlib 内存流压缩、解压并验证二进制往返。 |
| `tar_intern_bundle_113` | 使用 1.1.3 TarGzip 与字符串驻留完成目录归档和稳定标签处理。 |

### CLI、文件系统与工具链

| 目录 | 简介 |
|---|---|
| `cli_log_report` | 组合 argopt、环境变量、文件、Regex、时间和子进程生成日志报告。 |
| `quality_gate_expression_vm` | 实现表达式 VM，并用 cjfmt、cjlint、cjcov 和 cjpm 建立质量门禁。 |
| `cli_query` | 使用 `std.argopt`、Option 和 Unicode 大小写实现类型化查询计划。 |
| `directory_snapshot` | 递归遍历 Path/Directory/FileInfo，排序并生成目录快照。 |
| `tool_probe` | 探测环境变量、外部进程、源码目录和工具可用性。 |
| `ranked_notes` | 解析 CLI 和文本输入，稳定排序并输出便签。 |
| `route_cli` | 组合 argopt 与 Regex 实现多规则文本路由。 |
| `multiplatform_dispatch_113` | 使用 common/specific、feature 与 source-set 构建并测试 Windows 产品源码集。 |

### 网络、安全与综合工程

| 目录 | 简介 |
|---|---|
| `tcp_line_store` | 基于 TCP 回环、超时、同步原语和 Resource 实现行协议存储。 |
| `cidr_udp_router` | 覆盖 IPv4/IPv6 CIDR、最长前缀匹配和 UDP 回环。 |
| `secure_crypto_envelope` | 组合 SecureRandom、RSA-OAEP、签名、PEM、摘要与 Hex。 |
| `x509_chain_inspector` | 解析 X.509/CSR、SAN、PEM/DER 并按固定时间验证证书链。 |
| `notebook` | 使用 stdx HTTP、TLS 和 JSON 实现笔记服务端与客户端。 |
| `web_framework` | 实现 IoC、路由、中间件和上下文模型的 Web 框架。 |
| `kalman_filter` | 用 C 实现滤波核心，并通过 C FFI 完成目标跟踪仿真。 |
| `linq_dsl` | 开发独立宏包，用仓颉宏、Token 和 quote 实现 LINQ 风格 DSL。 |
| `event_ledger_archive` | 综合覆盖建模、集合、Decimal、并发、流式 JSON、压缩、摘要和端序。 |
| `secure_local_sync` | 综合覆盖本机 HTTPS、TLS/X.509、JSON、压缩、摘要、并发和资源关闭。 |
| `macro_native_source_auditor` | 多模块综合任务：声明宏、AST、反射、C FFI、工具链和确定性报告。 |
| `interop_handle_registry_113` | 使用 std.interop 的 ExportedRef、InteropContext 与 ExportTable 管理不透明跨语言句柄。 |

## 增量开发

| 目录 | 简介 |
|---|---|
| `source_catalog_increment` | 在给定多文件目录模型上增加扩展名过滤、递归扫描和 Regex 查询。 |
| `auditor_incremental` | 基于随题 seed，为宏/AST/FFI 审计 workspace 增加不可变策略、跨包扫描和兼容 API。 |

## 问题修复

| 目录 | 简介 |
|---|---|
| `binary_frame_fix` | 修复端序、数组复制、长度校验和损坏帧处理。 |
| `metric_book_fix` | 修复 ConcurrentHashMap、AtomicInt64、排序和统计一致性。 |
| `frame_decoder_fix` | 修复多文件增量帧解码器的分片、缓存和错误恢复。 |
| `bounded_mailbox_fix` | 修复有界邮箱的关闭、排空、超时和阻塞线程唤醒。 |
| `auditor_repair` | 基于随题故障 seed，在大型宏/AST/反射/C FFI workspace 中定位并修复分散逻辑回归。 |

## 收录与维护约定

- 只收录已由真实 Agent 开发、并由 `cjc/cjpm` 或任务专用验收验证过的题目。
- 一个任务只保留一份规范输入；同题不同 Skill、模型或复测运行不重复归档。
- 测试文件必须可见但不可修改；复杂任务应使用 seed、冻结哈希和独立验收脚本保护输入。
- 新任务优先覆盖新的语言/API 组合或开发形态，不为单一知识条目设计过拟合题目。
- 任务发现知识缺陷后，可以修复 Skill，但不要把参考实现或修复结论回填进题面。
- 修改任务后运行 `python validate.py`，并把修正与相应测试一起提交；本目录现在就是版本库中的权威 E2E 任务源。
