<!-- cj-doc kind="guide-topic" level="3" id="language.package" parent="language" -->
# 包与导入

[← 语言特性](../index.md)

package、main、import、public import 与顶层可见性。

| 规则/任务 | 摘要 |
|---|---|
| [1. 包概述](1-包概述/index.md) | 包是最小编译单元，产生 AST/静态/动态库文件 |
| [2. 包声明](2-包声明/index.md) | 使用 `package pkg1.sub1` 声明，须与相对于 `src/` 的目录路径匹配 |
| [3. 程序入口](3-程序入口/index.md) | `main` 是入口点，每个根包最多一个 |
| [4. 包导入](4-包导入/index.md) | 须在 `package` 之后、其他声明之前 |
| [5. 顶层访问修饰符](5-顶层访问修饰符/index.md) | `package` 声明默认为 `public` |
