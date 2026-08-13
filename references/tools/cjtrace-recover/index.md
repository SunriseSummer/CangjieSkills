<!-- cj-doc kind="guide-topic" level="3" id="tools.cjtrace-recover" parent="tools" -->
# cjtrace-recover 异常堆栈还原

[← 工具链](../index.md)

`cjtrace-recover` 使用混淆编译时生成的符号映射文件，还原异常堆栈中的函数名和源码路径；结果写到标准输出。

| 规则/任务 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | `cjtrace-recover` 使用混淆编译时生成的符号映射文件，还原异常堆栈中的函数名和源码路径；结果写到标准输出。 |
| [1. 命令选项](1-命令选项.md) | 代码展示 `cjtrace-recover -f <stacktrace-file> -m <map-file,...>` 的典型用法。 |
| [2. 还原并保存结果](2-还原并保存结果.md) | 映射文件必须来自产生该堆栈的混淆构建；版本或构建不匹配时不能可靠还原符号。 |
