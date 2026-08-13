<!-- cj-doc kind="guide-index" level="5" id="language.macro.overview.3-宏实现" parent="language.macro.overview" -->
# 3. 宏实现

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 非属性宏](3-1-非属性宏.md) | 声明宏（发布文档称非属性宏）用一个 `Tokens` 参数定义，以 `@Macro(...)` 或声明前 `@Macro` 调用，不使用属性参数方括号。 |
| [3.2 属性宏](3-2-属性宏.md) | 属性宏接收属性与输入两组 `Tokens`；若它用 `parseDecl(input)` 期待裸声明，与其他注解叠加时应紧贴声明，避免输入仍以另一注解开头。 |
| [3.3 嵌套宏](3-3-嵌套宏.md) | 宏定义不能嵌套，但宏调用可以出现在宏定义和宏调用处内部 |
| [3.4 嵌套宏通信](3-4-嵌套宏通信.md) | `assertParentContext("OuterMacroName")` — 若内层宏不在指定外层宏内则报错 |
