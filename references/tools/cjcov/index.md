<!-- cj-doc kind="guide-topic" level="3" id="tools.cjcov" parent="tools" -->
# cjcov 覆盖率

[← 工具链](../index.md)

覆盖率插桩、报告生成、分支统计、文件过滤与 cjpm 集成。

| 规则/任务 | 摘要 |
|---|---|
| [1. 概述](1-概述.md) | `cjcov`（Cangjie Coverage）用于生成仓颉程序的覆盖率报告，支持行覆盖率和分支覆盖率，输出 HTML、XML、JSON 格式。 |
| [2. 基本流程](2-基本流程/index.md) | Windows cjnative 1.0.5 的稳健做法是把需要报告的 `.gcda`/`.gcno` 复制到项目根附近的短目录，再把该目录传给 `--root`。 |
| [3. 命令选项](3-命令选项.md) | 速查`-h` / `--help`：显示帮助；`-v` / `--version`：显示版本号；`-r ROOT` / `--root=ROOT`：gcda/gcno 文件所在根目录（默认当前目录）；另含更多表项。 |
| [4. 典型使用示例](4-典型使用示例/index.md) | 生成 `index.html`（总览）和每个源文件对应的子 HTML。 |
| [5. 注意事项](5-注意事项.md) | 不会统计行覆盖率的场景：全局变量定义、未初始化的成员变量声明、无函数体的函数声明（如 `foreign`）、枚举类型定义、class/extend 定义行 |
| [6. 常见问题](6-常见问题.md) | 速查找不到 `llvm-cov`：设置 `CANGJIE_HOME` 环境变量，或手动安装 `llvm-cov`；`OutOfMemoryError`：增大堆内存：`export cjHeapSize=2GB`。 |
