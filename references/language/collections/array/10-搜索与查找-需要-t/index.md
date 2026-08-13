<!-- cj-doc kind="guide-index" level="5" id="language.collections.array.10-搜索与查找-需要-t" parent="language.collections.array" -->
# 10. 搜索与查找（需要 T <: Equatable<T>）

[← Array 类型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 以下方法需要元素类型 `T` 实现 `Equatable<T>` 接口。 |
| [10.1 `contains` — 判断是否包含元素](10-1-contains-判断是否包含元素.md) | `func contains(element: T): Bool`：判断是否包含元素。 |
| [10.2 `indexOf` — 查找元素/子数组位置](10-2-indexof-查找元素-子数组位置.md) | `func indexOf(element: T): Option<Int64>`：查找元素/子数组位置。 |
| [10.3 `lastIndexOf` — 查找最后出现位置](10-3-lastindexof-查找最后出现位置.md) | `func lastIndexOf(element: T): Option<Int64>`：查找最后出现位置。 |
| [10.4 `removePrefix` / `removeSuffix`](10-4-removeprefix-removesuffix.md) | `func removePrefix(prefix: Array<T>): Array<T>`：removePrefix / removeSuffix。 |
| [10.5 `trimStart` / `trimEnd`](10-5-trimstart-trimend.md) | `func trimStart(elements: Array<T>): Array<T>`：trimStart / trimEnd。 |
