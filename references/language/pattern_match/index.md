<!-- cj-doc kind="guide-topic" level="3" id="language.pattern_match" parent="language" -->
# 模式匹配

[← 语言特性](../index.md)

match、常量和绑定模式、枚举和类型模式、守卫、穷举与 if-let。

| 规则/任务 | 摘要 |
|---|---|
| [1. match 表达式](1-match-表达式/index.md) | 模式后添加 `where condition`（`Bool` 类型），case 仅在模式匹配且守卫为 `true` 时匹配。 |
| [2. 模式类型](2-模式类型/index.md) | 匹配任意值，通常用作最后一个 case 兜底。 |
| [3. 模式可反驳性](3-模式可反驳性.md) | 速查`常量`：始终可反驳；通配符 `_`：始终不可反驳；绑定 `id`：始终不可反驳；另含更多表项。 |
| [4. 其他模式匹配语法/场景](4-其他模式匹配语法-场景/index.md) | 除 `match` 外，模式也用于变量定义、`for-in`、`while-let` 和 `if-let`；不同场景对可反驳性有不同要求。 |
| [5. 完整可运行示例](5-完整可运行示例.md) | 用带负载枚举表示不同图形，通过 `match` 解构参数并计算面积，再用无匹配值的 `match` 按条件分类。 |
