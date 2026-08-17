# 问题修复：宏与原生接口源码审计器

先把 `seed/` 复制到隔离工作目录。它是一个已有的仓颉 1.1.3 多模块源码审计器，包含编译期宏、`std.ast` 源码分析、反射式规则注册、C FFI、确定性报告和命令行应用。项目目前可以编译，但一次错误合并引入了多处互不相关的逻辑回归。不得修改任务目录中的 `seed/`。

## 目标

定位并修复生产代码中的根因，使所有冻结测试与质量门禁通过。不要重写项目，不要改变既有公开 API、规则编码、报告格式、退出码或冻结文件。

已观察到的症状包括：

- 严重级别阈值和 finding 排序不再符合契约；
- AST 声明索引漏项，标识符顺序异常；
- 禁用规则可能进入运行时注册表；
- TODO 统计及其报告顺序不稳定；
- `NativeDigest` 资源关闭状态错误；
- CLI 对 Fatal finding 的退出码错误。

这些是外部症状，不保证与代码缺陷一一对应；请从测试、调用关系和实现语义定位根因，做最小而完整的修复。

## 不变量

- 工具链：仓颉 `1.1.3`、cjnative、Windows x64；仅使用 `std.*`，不联网。
- 工作目录保持 cjpm workspace，模块为 `auditor_macros`、`auditor_core`、`auditor_app`。
- 生产 `.cj` 代码须保持 600～2000 行，至少 8 个生产文件、4 个包；测试、夹具、报告和生成物不计入。
- `cjpm build` 与 `cjpm test` 不得产生 warning；冻结测试总数为 59，必须全部通过。
- 输出必须确定，不依赖目录、HashMap 或反射集合的遍历顺序。
- C 动态库由 `accept.py` 从随项目提供的源码构建。

## 冻结资产与验收

禁止修改 `task.md`、`frozen/**`、`frozen-hashes.json`、`accept.py`、`quality.py`。运行：

```shell
python accept.py --project <work-directory>
```

验收会校验冻结哈希，恢复测试/夹具，构建原生库，执行 clean/build/test、59 个行为测试、CLI 正常/错误路径、黄金报告、cjfmt、cjlint 和测试 XML 门禁。
