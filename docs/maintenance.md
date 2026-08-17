# 维护指南

[← 项目说明](../README.md)

## 维护原则

- `references/` 下的活动 Markdown 与 manifest 是唯一权威知识源。
- 修复应落在正确抽象层：知识错误改页面，路由错误改 manifest 或索引，查询问题改共享检索核心，Agent 行为原则才写入 `SKILL.md`。
- `SKILL.md` 保持短小、稳定，只描述必要工作流，不堆叠具体任务补丁。
- 非叶子摘要必须能帮助选择下一级；叶子页面只承载该特性或 API 的完整契约。
- 不收录 deprecated API，不用其他语言的相似 API 猜测仓颉行为。
- 原始发布资料不是常驻输入。如需核验或升级，在项目外临时准备资料并人工合并必要差异。

## 修改知识页面

### 语言、工具链与应用示例

编辑 `references/language/`、`references/tools/` 或 `references/examples/`，并同步维护：

1. 页面首行 `cj-doc` 的 `id/kind/level/parent`；
2. `references/guide-manifest.json` 中的记录；
3. 直接父索引的入口、签名式摘要或场景说明；
4. 新增、移动或删除节点影响到的子树关系；
5. 适用的 `cjtest` 示例标记。

语言索引应说明“是什么、何时使用、关键限制”，不要用 `class Foo {` 一类示例入口充当摘要。应用示例保持单一教学目标；多文件、多代码块页面要在每个代码块前说明其角色。

### std 与 stdx API

编辑 `references/api/` 中的包、类型或成员页面，并同步对应 API manifest。类型页应保留：

- 简洁的类型定位和适用场景；
- 所有未废弃成员的准确签名；
- 足以判断普通用法的一句话契约；
- 需要进一步展开的成员链接。

成员叶子说明参数、返回值、异常、边界、平台差异和复杂用法。仅为重要、易误用或需要上下文的 API 提供高质量可执行示例；常规自明成员不为追求覆盖率重复堆砌代码。

## 维护检索数据

共享查询逻辑位于 `scripts/doc_search/`，Markdown 与 SQLite 后端必须保持行为一致。模块应保持单一职责，单文件尽量不超过 300 行。

确定性检索回归集位于：

```text
scripts/tests/data/retrieval-evaluation-queries.json
```

新增查询时，应选择可泛化的语言特性、API、工具或场景意图，并提供合理领域和至少一个预期节点。不要为了通过某个开发任务加入高度特化的短语映射；优先改善页面标题、摘要、别名、符号切分或通用排序特征。

若编译示例需要显式上下文模板，可把受控 fixture 放在 `scripts/tests/data/fixtures/`。不得根据自然语言上下文猜测导入、变量或所属类型。

## 构建与同步发布件

在项目根目录运行：

```shell
python build.py
python build.py --check
```

首次命令重新生成路由索引、同步发布脚本并构建数据库；第二条命令验证工作区没有陈旧生成物。不要手工编辑 `.agents/skills/cangjie-coding/`，其中所有内容都由根目录的 `SKILL`、`scripts/` 和 `references/` 构建产生。

构建后检查发布目录只包含架构文档列出的文件。Markdown、测试、报告、缓存或临时数据库进入发布件均应视为错误。

## 验证顺序

每次知识或检索修改至少执行：

```shell
python build.py --check
python scripts/validation/validate_structure.py
python -m unittest discover -s scripts/tests -p "test_*.py" -q
python scripts/evaluation/benchmark_database_backend.py --output reports/database-benchmark.json
```

涉及示例时，再按照[测试指南](testing.md)运行对应的 syntax、compile、run 或 project 模式。涉及 stdx 安装器时，应补跑版本策略、离线包、哈希校验、项目配置和多进程并发测试。

本地 JSON 报告写入 `reports/`；该目录由 `.gitignore` 排除，不是验收依据本身。验收以命令退出状态、结构错误数、双后端一致性和示例结果为准。

## 缺陷修复流程

1. 用最小查询或最小仓颉项目复现问题；
2. 判断缺陷属于知识契约、父级摘要、manifest、检索排序、运行脚本还是 Agent 指令；
3. 在最低且可泛化的层修复；
4. 添加能稳定捕获该缺陷的页面测试、查询回归或可执行示例；
5. 重建发布件并运行相应全量门禁；
6. 用至少一个不同场景确认修复没有退化为特定任务补丁。

## 工具链或知识基线升级

升级时，在项目外的临时目录准备对应官方资料，并记录来源、版本和校验值。按领域对照当前活动页面，以真实工具链实验确认差异，然后人工修改知识树和 manifest。不要从原始资料批量重生成已经精炼的页面。

不兼容的语言或 API 语义应维护为独立发布基线，避免一个数据库同时向 Agent 暴露多套冲突契约。完成对照和验证后删除临时原始资料，不把它加入 `references/` 或发布数据库。

## 发布检查清单

- README、开发态 `SKILL`、发布态 `SKILL.md`、知识基线和工具行为一致；
- manifest、父索引、页面 ID、路径和链接全部通过结构验证；
- deprecated API 未进入检索结果；
- 开发态和发布态查询结果一致；
- 新增示例具有明确教学目标、代码块说明和正确测试标记；
- `python build.py --check` 通过；
- 发布目录无 Markdown 树、测试数据、报告、缓存或临时文件；
- Git 工作区只包含预期源文件与确定性生成物。
