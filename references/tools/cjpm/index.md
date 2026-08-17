<!-- cj-doc kind="guide-topic" level="3" id="tools.cjpm" parent="tools" -->
# cjpm 项目管理

[← 工具链](../index.md)

新建可执行模块用 `cjpm init --name <合法包名> --type=executable`（`executable` 也是默认类型）；随后用 `build/test/run` 构建、测试和运行，并通过 `cjpm.toml` 管理依赖与工作区。

| 规则/任务 | 摘要 |
|---|---|
| [1. 基本用法](1-基本用法.md) | 新模块优先由 `cjpm init --name <合法包名> --type=executable` 生成完整清单和源码骨架，不要手写不完整的 `cjpm.toml`；1.1.3 程序参数用 `cjpm run -- <args...>` 原样传递。 |
| [2. 项目结构与 cjpm.toml](2-项目结构与-cjpm-toml/index.md) | 注意：`[package]` 与 `[workspace]` 互斥，不可同时使用。 |
| [3. 常用命令选项表](3-常用命令选项表/index.md) | 1.1.3 用 `cjpm run -- <args...>` 保留参数边界；Windows 上仍需直接运行产物才能断言程序非零退出码。 |
| [4. 依赖管理](4-依赖管理/index.md) | 子页分别说明源码依赖、测试依赖、依赖替换、构建脚本依赖。 |
| [5. 测试与基准](5-测试与基准/index.md) | 测试文件以 `_test.cj` 结尾，放在 `src/` 目录下。 |
| [6. 高级配置](6-高级配置/index.md) | 每个键都会成为一个不带值的 cjpm 开关。 |
| [7. 包扫描、循环依赖与命令扩展](7-包扫描-循环依赖与命令扩展/index.md) | 一个目录仅在以下条件同时成立时才会被 cjpm 识别为源码包：目录内直接包含至少一个 `.cj` 文件；从该目录到模块 root 包的每一层父包也都是有效源码包。 |
| [8. 关键规则速查](8-关键规则速查.md) | 速查`配置互斥`：`[package]` 与 `[workspace]` 不可同时存在；`测试文件`：文件名以 `_test.cj` 结尾，使用 `@Test` 宏标注；`默认输出`：可执行文件默认名为 `main`，产物在 `target/release/bin/`；另含更多表项。 |
