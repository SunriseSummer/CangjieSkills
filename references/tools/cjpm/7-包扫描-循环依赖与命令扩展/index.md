<!-- cj-doc kind="guide-index" level="4" id="tools.cjpm.7-包扫描-循环依赖与命令扩展" parent="tools.cjpm" -->
# 7. 包扫描、循环依赖与命令扩展

[← cjpm 项目管理](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [7.1 有效源码包](7-1-有效源码包.md) | 一个目录仅在以下条件同时成立时才会被 cjpm 识别为源码包：目录内直接包含至少一个 `.cj` 文件；从该目录到模块 root 包的每一层父包也都是有效源码包。 |
| [7.2 循环依赖](7-2-循环依赖.md) | `build`、`check`、`tree` 等解析包依赖的命令会报告循环路径并中止。 |
| [7.3 扩展 cjpm 子命令](7-3-扩展-cjpm-子命令.md) | 把 `cjpm-xxx`（Windows 为 `cjpm-xxx.exe`）放入 `PATH` 后，可用 `cjpm xxx [args]` 调用，效果等同于直接运行该程序。 |
