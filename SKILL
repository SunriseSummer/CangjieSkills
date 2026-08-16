---
name: cangjie-coding
description: "提供仓颉编程语言的完备知识库及辅助工具，覆盖仓颉语言特性、标准库、扩展标准库、工具链与典型应用案例，渐进披露、按需查询，助你高效学习仓颉知识、完成仓颉项目开发。"
---

# Cangjie Coding

知识库采用“主题索引 → 细分索引/API 成员表 → 叶子契约与示例”的渐进披露结构。先读能作出决定的最小信息，再实现和验证。

## 必须遵守

- 把**当前已加载的 `SKILL.md` 所在目录**记为 `<skill-root>`，按需调用 `<skill-root>/scripts/search_docs.py`，不要绕过脚本直接读取知识库文件。
- 第一次知识访问使用一个脚本进程中的批量查询，每个独立符号或意图各写一个 `--query`；只有必须共同出现的“类型 + 操作”才放在同一查询中。摘要足够时停止，不为简单成员再展开正文。

## 工作流

1. 读取任务、清单、相关源码和测试，确认包名、公开契约、平台及验收命令。新模块用 `cjpm init --name <合法包名> --type=executable|static|dynamic` 生成骨架，不手写不完整的 `cjpm.toml`。
2. 汇总真正不确定的符号和概念：明确目标用批量 `--query`；完整场景优先查应用示例；不熟悉的领域才读最窄 `--view indexes`。
3. 根据结果中的签名、摘要和命中表项编码；需要参数、异常、限制或完整示例时，再把选定 ID 合并为一次 `--view leaves`。只有 `p!:` 可写成 `p: value`，普通 `p:` 按位置传递。
4. 先完成最小可编译切片并运行 `cjpm build`。同一轮诊断涉及多个未知符号时合并补查；连续猜错时读取精确叶子，并用最小编译实验确认类型、重载或语义。
5. 项目导入 `stdx.*` 时，先运行 `python <skill-root>/scripts/setup_stdx.py --project <project-root>`；脚本按 `cjc -v` 选择兼容 stdx，并全局复用 `~/.cangjie/stdx/`。离线可加 `--archive <release.zip> --offline`，配置已有构建的项目后先 `cjpm clean`。
6. 执行任务要求的 build/test/run 与专用工具门禁。只格式化本次修改的生产 `.cj` 文件；没有项目命令时逐文件运行 `cjfmt -f <file>`，不要格式化不可修改测试或无关文件。最终重新执行完整验收。

## 检索

下列命令从 `<skill-root>` 执行；在项目目录中调用时使用脚本绝对路径。

### 1. 批量摘要查询

```text
python scripts/search_docs.py --query "ArrayList reverse" --query "Int64 writeBigEndian" --query "cjpm run arguments" --max-results 2
```

每个查询独立排序，跨查询重复页只完整输出一次。默认每项返回 3 个候选；精确符号可用 `--max-results 1`，歧义时再扩大。可用 `--domain language|std|stdx|tools|examples` 限域。不要把互不相关的符号塞进一个长查询。结果标记 `ordinary_use_ready` 时，已包含普通调用所需的活动签名与契约；仅在任务还涉及异常、边界或完整示例时展开叶子。

### 2. 浏览索引树

```text
python scripts/search_docs.py --node language.collections --view indexes
python scripts/search_docs.py "集合类型" --view indexes
```

`indexes` 返回节点下全部非叶子页面。API 类型页本身就是成员列表，已列出所有未废弃成员的签名和一句话契约；这些信息足够时无需读取成员正文。

### 3. 批量读取叶子

```text
python scripts/search_docs.py --query "ArrayList reverse" --query "HashMap tuple iteration" --view leaves
```

`leaves` 可把多个独立 `--query` 与多个精确 `--node` 一次解析、合并并去重；返回所选节点下的叶子正文，精确叶子只返回自身，单个坏查询只产生警告而不丢弃有效节点。宽 API/主题会被拒绝，先读索引并用普通查询选出精确 ID，不要把 `--force` 当作常规流程。可先用 `--estimate` 查看页数和字符数，用 `--depth N` 限制层级。

应用示例固定为“场景分类 → 示例叶子”：先普通查询场景，选中后读取一个或少量示例 ID；只有需要浏览该分类时才查询 `examples.<category> --view indexes`。

### 4. 查询缺口与审计

无结果时依次缩短查询、改用仓颉精确符号、添加 `--domain`，或从最窄相关索引选择叶子；不要枚举知识库文件。若活动知识页仍缺少契约，使用当前工具链构造最小可复现实验并在交付中指出知识缺口，不凭其他语言经验猜写 API。`--trace-file <path.jsonl>` 只记录本地检索进程、结果和耗时，不等于模型请求、token 或费用。

## 证据与验证

冲突时依次采用：当前工具链的可复现实验、活动叶子契约、维护者为本次升级或修复显式提供的官方资料、模型记忆。精确 API 同时确认包、签名、命名参数、返回值、异常与平台限制，不套用其他语言或版本的相似写法。

- `python <skill-root>/scripts/cj_ast.py <path>` 可查看 import、声明和 Tree-sitter 解析恢复点。`ERROR/MISSING` 只是语法恢复信号，宏 token/DSL 可能产生假阳性。
- 类型、重载、宏展开、依赖和链接以 `cjc/cjpm` 为准。
- 仓颉工具链默认版本为 `1.0.5 (cjnative)`，对应的 stdx 为 `1.0.5.1`。
