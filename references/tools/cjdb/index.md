<!-- cj-doc kind="guide-topic" level="3" id="tools.cjdb" parent="tools" -->
# cjdb 调试器

[← 工具链](../index.md)

启动与附加、断点、单步、变量、表达式、观察点和线程调试。

| 规则/任务 | 摘要 |
|---|---|
| [1. 概述](1-概述/index.md) | `cjdb` 是基于 `lldb` 开发的仓颉程序命令行调试工具，位于 SDK 的 `cangjie/tools/bin` 路径下。 |
| [2. 启动调试](2-启动调试/index.md) | 子页分别说明launch 方式、attach 方式。 |
| [3. 断点](3-断点/index.md) | 子页分别说明源码断点、函数断点、条件断点、继续执行。 |
| [4. 单步执行](4-单步执行.md) | 速查`thread step-over`：`n` / `next`；`thread step-in`：`s` / `step`；`finish`：—。 |
| [5. 变量查看与修改](5-变量查看与修改/index.md) | 支持类型：基础类型、String、struct/class、Array、CString、Enum。 |
| [6. 表达式计算](6-表达式计算.md) | 注意：不支持带命名参数的函数调用、互操作、扩展、属性、别名、插值字符串、函数名。 |
| [7. 观察点](7-观察点.md) | 仅支持基础类型。 |
| [8. 仓颉线程](8-仓颉线程.md) | 代码展示 `(cjdb) cjthread list # 列出所有仓颉线程` 的典型用法。 |
| [9. 日志](9-日志.md) | 先用 `log list` 取得当前版本支持的名称，不要执行缺少参数的裸 `log enable`。 |
| [10. 常见问题](10-常见问题.md) | 速查Docker 下报 `packet returned an error: 8`：`packet returned an error: 8`、`--cap-add=SYS_PTRACE --security-opt seccomp=unconfined`、`SIGSEGV` 等（共 7 项）。 |
