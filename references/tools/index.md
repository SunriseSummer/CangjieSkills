<!-- cj-doc kind="index" level="2" id="tools" parent="references" -->
# 工具链索引

[← 总索引](../index.md)

每行只给范围摘要；进入主题页选择单个规则或任务，不要批量读取兄弟页。

| 主题 | 范围 |
|---|---|
| [Cangjie Language Server](cangjie-language-server/index.md) | `Cangjie Language Server` 是仓颉 IDE 语言服务后端，提供定义跳转、引用查找和代码补全。 |
| [chir-dis CHIR 反序列化](chir-dis/index.md) | `chir-dis` 把单个编译器 CHIR 序列化文件转成便于阅读的文本，适合检查已有 `.chir` 中间表示。 |
| [cjc 编译器](cjc/index.md) | 源码和包编译、输出类型、链接、调试、宏、条件编译、优化与交叉编译。 |
| [cjcov 覆盖率](cjcov/index.md) | 覆盖率插桩、报告生成、分支统计、文件过滤与 cjpm 集成。 |
| [cjdb 调试器](cjdb/index.md) | 启动与附加、断点、单步、变量、表达式、观察点和线程调试。 |
| [cjfmt 格式化](cjfmt/index.md) | 文件、目录和片段格式化，配置文件与格式规则。 |
| [cjlint 静态检查](cjlint/index.md) | 检查命令、规则分类、告警屏蔽与语法禁用检查。 |
| [cjpm 项目管理](cjpm/index.md) | 新建可执行模块用 `cjpm init --name <合法包名> --type=executable`（`executable` 也是默认类型）；随后用 `build/test/run` 构建、测试和运行，并通过 `cjpm.toml` 管理依赖与工作区。 |
| [cjprof 性能分析](cjprof/index.md) | CPU 采样、报告和火焰图、堆导出、引用分析与线程栈。 |
| [cjtrace-recover 异常堆栈还原](cjtrace-recover/index.md) | `cjtrace-recover` 使用混淆编译时生成的符号映射文件，还原异常堆栈中的函数名和源码路径；结果写到标准输出。 |
| [stdx 安装与项目配置](stdx-setup/index.md) | 用配套脚本按 `cjc` 版本和目标平台选择官方 stdx，复用用户级安装，并安全更新项目清单。 |
