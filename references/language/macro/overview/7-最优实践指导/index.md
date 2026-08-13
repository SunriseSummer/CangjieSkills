<!-- cj-doc kind="guide-index" level="5" id="language.macro.overview.7-最优实践指导" parent="language.macro.overview" -->
# 7. 最优实践指导

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [7.1 项目组织](7-1-项目组织.md) | 宏定义必须在 `macro package` 中，与调用代码分离为独立模块 |
| [7.2 输入验证](7-2-输入验证.md) | 始终验证输入节点类型，使用 `as` 模式匹配 + `diagReport` 报告错误 |
| [7.3 代码生成](7-3-代码生成.md) | 优先使用 `quote(...)` + `$(...)` 插值生成代码，保持模板可读性 |
| [7.4 AST 操作](7-4-ast-操作.md) | 使用 `parseDecl`/`parseExpr` 将 `Tokens` 转为强类型节点后再操作 |
| [7.5 调试与安全](7-5-调试与安全.md) | 开发阶段使用 `--debug-macro` 查看展开结果 |
