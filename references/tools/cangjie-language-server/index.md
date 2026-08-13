<!-- cj-doc kind="guide-topic" level="3" id="tools.cangjie-language-server" parent="tools" -->
# Cangjie Language Server

[← 工具链](../index.md)

`Cangjie Language Server` 是仓颉 IDE 语言服务后端，提供定义跳转、引用查找和代码补全。

| 规则/任务 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | `Cangjie Language Server` 是仓颉 IDE 语言服务后端，提供定义跳转、引用查找和代码补全。 |
| [1. 启动参数](1-启动参数.md) | 速查`-V`：生成服务器崩溃日志；`--enable-log=<true\|false>`：控制普通日志；省略时默认为 `true`；`--log-path=<path>`：指定普通日志和崩溃日志目录；省略时使用 LSPServer 所在目录；另含更多表项。 |
| [2. Windows 启动示例](2-windows-启动示例.md) | 正常开发应让 IDE 客户端管理服务器进程与标准输入输出连接；手动启动主要用于客户端集成和日志诊断。 |
