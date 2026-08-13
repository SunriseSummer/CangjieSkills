<!-- cj-doc kind="guide-index" level="5" id="language.collections.array.5-切片与分割" parent="language.collections.array" -->
# 5. 切片与分割

[← Array 类型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [5.1 范围下标切片](5-1-范围下标切片.md) | 注意：范围下标返回的是原数组的引用切片，修改会反映到原数组。 |
| [5.2 范围赋值](5-2-范围赋值.md) | `var arr = [0, 1, 2, 3, 4, 5]`：范围赋值。 |
| [5.3 `slice` — 获取切片](5-3-slice-获取切片.md) | `func slice(start: Int64, len: Int64): Array<T>`：获取切片。 |
| [5.4 `splitAt` — 在指定位置分割](5-4-splitat-在指定位置分割.md) | `func splitAt(index: Int64): (Array<T>, Array<T>)`：在指定位置分割。 |
