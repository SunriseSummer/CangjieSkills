# Cangjie Coding Skill

本项目提供高效赋能[仓颉编程语言](https://cangjie-lang.cn/) AI Coding 的技能库，核心是一套精炼的渐进披露知识库及查询引擎，覆盖仓颉语言特性、标准库、扩展标准库、工具链与典型应用实践。

这套知识库在开发态是 6000+ markdown 文件（[references/index.md](references/index.md)），便于编辑和校验，也可以作为开发者的学习资料；在构建发布 Skill 时，知识库将被压缩为单个 SQLite 数据库文件，分发和查询更高效。开发态与发布态共用一套查询脚本。

## Skill 特点

- **严格渐进披露**：知识库按“全局入口 → 领域索引 → 主题或类型成员表 → 叶子契约与示例”逐层提供仓颉技术知识，Agent 根据指导按需取用，摘要足够时立即停止，有效降低知识库 token 开销。
- **面向任务的查询**：支持多意图批量检索、精确节点解析、非叶子子树总览、叶子正文聚合、展开规模预估及领域过滤，Agent 根据任务场景按需查询、高效学习。
- **推荐契约优先**：API 知识仅暴露当前推荐成员，关键技术点配有经过语法、编译、运行或完整工程验证的示例。
- **stdx 自动配置**：执行涉及扩展标准库的开发任务时，Agent 可调用脚本自主下载和配置兼容的 `stdx` 版本。
- **紧凑标准发布**：发布件只携带 Skill 指令、工具脚本和只读 SQLite 数据库。

相比上一代 CangjieSkills 的效能优化情况（表中 v4 对应当前版本）：

<img width="1751" height="1316" alt="test1" src="https://github.com/user-attachments/assets/16bbf359-6d2b-47ba-8c7e-8e9c6decf8c0" />

## 快速使用

`.agents/skills/cangjie-coding` 是 Skill 发布件，将该目录复制到所用 AI Coding 环境支持的 Skill 位置，即可体验仓颉 AI 编码自由🎉。如果系统已安装 node/npx，也可以执行以下命令一键安装配置：

```shell
npx skills add SunriseSummer/CangjieSkills
```

> 基于这套 Skill 开发仓颉项目之前，请确保系统已全局安装 Cangjie SDK 1.0+ 和 Python 3.11+

## 项目结构

```text
├── .agents/skills/cangjie-coding/   # Skill 发布件
├── README.md
├── build.py                         # 用于构建 Skill 发布件
├── SKILL.md                         # 开发态与发布态共用的 Agent 指令
├── references/                      # 仓颉编程语言知识库
│   ├── language/                    # 语言特性
│   ├── api/                         # std/stdx API
│   ├── examples/                    # 应用示例
│   └── tools/                       # 工具链
├── scripts/
│   ├── search_docs.py               # 知识库查询入口
│   ├── doc_search/                  # 查询引擎实现
│   ├── setup_stdx.py                # stdx 下载和配置
│   ├── stdx_setup/
│   ├── cj_ast.py                    # 基于 tree-sitter-cangjie 的语法检查工具
│   ├── maintenance/                 # 索引与数据库构建
│   ├── validation/                  # 知识与示例验证
│   ├── tests/                       # 单元测试及测试数据
│   └── evaluation/                  # 查询一致性与性能评测
├── docs/                            # 架构、测试和维护手册
└── e2etests/                        # AI Coding 端到端测试集
```

开发目录本身也可作为 Skill 使用，此时同一查询入口自动读取 Markdown 后端，便于修改后立即检查：

```shell
python scripts/search_docs.py --query "ArrayList reverse" --query "cjpm test" --max-results 2
python scripts/search_docs.py --node language.collections --view indexes
python scripts/search_docs.py --query "HashMap tuple iteration" --view leaves
```

## 开发与维护

- [技术架构](docs/architecture.md)：知识分层、双后端检索、数据库及发布边界。
- [测试指南](docs/testing.md)：示例标记、执行能力、质量门禁和查询评测。
- [维护指南](docs/maintenance.md)：知识修改、索引维护、构建发布与升级流程。

基础构建仅依赖 Python 3.11+ 及其标准库：

```shell
python build.py
```

完整示例验证还需仓颉工具链、`markdown-it-py`、`tree-sitter`/`tree-sitter-cangjie`，部分能力测试按需使用网络和 Clang 等工具。各种验证操作：

```powershell
python build.py --check
python scripts/validation/validate_structure.py
python -m unittest discover -s scripts/tests -p "test_*.py" -q
python e2etests/validate.py
```

`build.py` 会生成确定性的路由索引，同步发布运行时，构建并校验 SQLite 数据库。`--check` 只检查工作区和发布件是否一致，不修改文件。

`e2etests/` 中有几十个经过 Agent 开发验证的标准测试任务，可用于当前 Skill 的功能验证和对比测评等。它只包含题面、冻结测试、fixture、故障 seed 和跨平台验收脚本，不包含参考实现、历史运行结果或构建产物。


