# 示例标记与测试约定

[← 项目说明](../README.md)

## 端到端 AI Coding 回归

`e2etests/` 覆盖从零开发、增量开发和问题修复，观察知识查询、实现修正与最终工具链验收的整体效果；它与本页后文的文档代码块验证互补。执行或扩充任务前阅读 `e2etests/README.md`，复制单个任务到隔离工作区运行，禁止把参考实现和历史输出作为 Agent 输入。提交任务集前执行 `python e2etests/validate.py`。

任务输入只保留题面、冻结测试、fixture、故障 seed 和 Python 验收脚本。`oracle/`、`target/`、`reports/`、trace、模型会话和参考答案均不得进入版本库；需执行自定义门禁的任务使用跨平台 Python，不使用 PowerShell、批处理或 shell 专属脚本。从仓库根任务集归档时运行 `python scripts/maintenance/sync_e2etests.py ../../.task`，不要向已有目录做增量复制。

## 文档示例验证

只执行 fence info string 中显式声明 `cjtest=` 的代码块。不得根据 `main`、自然语言“输出如下”或相邻代码块猜测测试方式。

## 模式

| 标记 | 用途 | 验证器 |
|---|---|---|
| `cjtest=syntax` | 不需要类型上下文的简单语法；用 `form=unit/expr/stmt/member` 声明形态。 | tree-sitter-cangjie；只判断是否发生解析恢复。 |
| `cjtest=compile` | 完整单文件程序，或带显式 fixture 的片段。 | 临时 cjpm 工程执行 `cjpm build`。 |
| `cjtest=run` | 完整单文件程序并可选匹配输出。 | `cjpm run`。 |
| `cjtest=project` / `cjtest=file` | 多文件或完整 `cjpm.toml` 工程。 | 重建临时工程后执行受控的 `check/build/run/test`。 |
| `cjtest=skip` | 当前环境不可自动验证的示例。 | 必须提供非空 `reason`；不计为通过。 |
| `role=signature` | API 声明摘录，不是示例。 | 不执行，也不计入示例覆盖率。 |

输出比较会统一换行符，并剔除 cjpm 1.1.3 在程序结束后追加的 `cjpm run finished` 启动器提示；JSON 报告仍保留原始 stdout/stderr。

## 代码块上下文

应用示例中的每个代码块前必须紧邻一句简短说明，先交代该块的职责，再展示内容。单文件示例说明其验证目标；多文件工程分别说明根清单、子包清单、本机源码和仓颉源码的角色；输出或诊断块明确写“预期标准输出”“预期标准错误”或“预期标准错误中包含”。不得让连续代码块直接相邻，也不得只用“代码如下”这类没有教学信息的占位语。生成器会为遗漏项补上带文件路径的最小上下文，结构校验仍会拒绝发布页中无上下文的 fence。

## 单文件与预期输出

````markdown
```cangjie cjtest=run id=hello form=unit timeout=10s
package hello

main(): Unit {
    println("hello")
}
```

```text cjtest=expect for=hello stream=stdout match=exact
hello
```
````

`match` 可为 `exact`、`contains` 或 `regex`；换行统一为 LF，并忽略末尾换行差异。`compile/run` 的 `form` 不是 `unit` 时必须指定 `fixture=`，禁止测试器猜测导入、变量和所属类型。

编译反例使用 `cjtest=compile exit=1`，再用 `cjtest=expect stream=stderr` 匹配稳定诊断短语；不要匹配包含路径、行列号或终端颜色的完整输出。

## 完整 cjpm 工程

````markdown
```toml cjtest=project id=project-demo file=cjpm.toml command=run timeout=60s
[package]
cjc-version = "1.1.3"
name = "project_demo"
version = "0.1.0"
output-type = "executable"
```

```cangjie cjtest=file project=project-demo file=src/main.cj
package project_demo

main(): Unit {
    println("project-ok")
}
```

```text cjtest=expect for=project-demo stream=stdout
project-ok
```
````

同一工程的所有文件必须位于同一 Markdown 文件；`file` 只能是安全相对路径。命令只允许 `check/build/run/test`。含 `build.cj` 的工程必须声明 `requires=build-script`，运行时还需显式 `--allow build-script`。C FFI 示例可声明 `requires=native-c`：工程须提供 `native/native.c` 和 `[ffi.c] native = { path = "./libs/" }`；放行后测试器用 PATH 中的 Clang 生成当前平台的 `libnative` 动态库，Windows 还会生成运行期所需的 `native.dll` 副本。

要断言可执行程序自身的退出码，可在 `command=run` 上添加 `launcher=direct` 和可选 `args="..."`。测试器会先执行固定的 `cjpm build`，再直接启动 `target/release/bin/main[.exe]`，不经过 shell，并把 `bin-dependencies.path-option` 加入子进程 PATH。该模式用于避开仓颉 1.1.3 `cjpm run` 不透传程序非零退出码的问题；仍可用根块的 `exit=N` 及 `cjtest=expect stream=stderr` 同时断言状态和诊断。

## 环境、跳过与失败

- `requires=stdx,network,native-c` 声明能力；运行器只执行通过 `--allow` 放行的能力。放行 `stdx` 后，运行器会先调用 `scripts/setup_stdx.py` 配置临时 cjpm 工程；测试显式覆盖安装根目录，以免污染用户全局缓存。放行 `native-c` 会执行上述固定 Clang 构建流程，不接受文档提供任意命令。
- `env=NAME` 只声明环境变量名，报告不输出值；`os=windows/linux/macos` 限制平台。
- `skip=true reason="..."` 或 `cjtest=skip ... reason="..."` 必须说明原因。
- 未标记的活动 Cangjie fence 状态为 `UNCLASSIFIED`；`--strict` 下令测试失败。
- 每个测试使用隔离临时目录并限制超时；失败时可用 `--keep-failed` 保留工程。

常用命令：

```text
python scripts/validation/test_examples.py references --list --strict --json reports/example-inventory.json
python scripts/validation/test_examples.py references --mode syntax --strict --min-pass 417 --json reports/example-syntax.json
python scripts/validation/test_examples.py references --mode compile,run,project --strict --allow stdx --allow network --allow native-c --allow build-script --min-pass 174 --max-compiler-warnings 0 --json reports/example-execution.json
python scripts/validation/test_examples.py references --id project-demo
```

当前整库清单包含 592 项：417 项简单语法验证、174 项真实编译/运行/工程验证和 1 项显式说明的跳过。已验证示例不能减少，成功编译或运行的示例不得产生编译器 warning。预期编译失败的反例不计 warning，但仍须用 `exit=1` 和稳定诊断断言明确标记。API 只保留带 `cjtest` 的精选示例；语言与工具链片段能无恢复解析时按 `syntax` 看护。各 `--allow` 只放行对应的受控能力；只有 `--allow network` 表示允许测试访问网络。提高覆盖后应同步收紧数值。

直接修改 `references/` 中的权威 Markdown 及对应 manifest；随后运行 `python build.py` 刷新路由索引和 `.agents/skills/cangjie-coding/references/knowledge.sqlite3`。以上命令均以项目根目录为当前目录。`reports/` 会按需创建且已被 Git 忽略。
