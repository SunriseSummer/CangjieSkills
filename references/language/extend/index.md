<!-- cj-doc kind="guide-topic" level="3" id="language.extend" parent="language" -->
# 扩展

[← 语言特性](../index.md)

直接扩展、接口扩展、泛型扩展、访问规则、孤儿规则与导入导出。

| 规则/任务 | 摘要 |
|---|---|
| [1. 扩展概述](1-扩展概述/index.md) | 扩展为当前包中任何可见类型添加新功能 — 函数、元组和接口除外。 |
| [2. 直接扩展](2-直接扩展/index.md) | 直接扩展使用 `extend Type` 为现有类型增加成员，不修改原类型声明；泛型类型可按具体实参扩展，或用 `extend<T>` 保留类型参数。 |
| [3. 接口扩展](3-接口扩展/index.md) | 接口扩展让既有类型获得一个或多个接口能力；已存在且签名匹配的成员可直接满足接口，冲突的默认实现必须显式消解。 |
| [4. 访问规则](4-访问规则/index.md) | 允许：`static`、`public`、`protected`、`internal`、`private`、`mut` |
