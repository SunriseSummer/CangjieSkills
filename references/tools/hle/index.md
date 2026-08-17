<!-- cj-doc kind="guide-topic" level="3" id="tools.hle" parent="tools" -->
# HLE 互操作代码生成

[← 工具链](../index.md)

HLE（HyperlangExtension）是 1.1.3 首次提供的互操作代码模板生成器，输入 ArkTS 声明文件或 C 头文件，输出仓颉胶水代码。

| 规则/任务 | 摘要 |
|---|---|
| [1. 安装依赖与公共选项](1-安装依赖与公共选项.md) | ArkTS 模式依赖 Node.js/TypeScript，C 模式依赖 cjbind；输入可为单文件或目录。 |
| [2. 从 ArkTS 生成绑定](2-从-ArkTS-生成绑定.md) | 解析 `.d.ts`/`.d.ets`，生成仓颉代码及描述 ArkTS 声明的 JSON。 |
| [3. 从 C 头文件生成绑定](3-从-C-头文件生成绑定.md) | 用 cjbind 解析 `.h`，并通过 `--clang-args` 提供自定义 include 路径。 |
