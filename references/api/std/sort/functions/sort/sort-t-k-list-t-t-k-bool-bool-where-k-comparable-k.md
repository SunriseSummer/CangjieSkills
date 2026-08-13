<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-k-list-t-t-k-bool-bool-where-k-comparable-k" parent="std.sort.func.sort" -->
# sort<T, K>(List<T>, (T) -> K, Bool, Bool) where K <: Comparable<K>

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T, K>(data: List<T>, key!: (T) -> K, stable!: Bool = false, descending!: Bool = false): Unit where K <: Comparable<K>
```

对 `List` 按照指定的键（键与键之间可比较）进行排序。

## 契约

功能：对 `List` 按照指定的键（键与键之间可比较）进行排序。可根据入参指定是否要进行稳定排序，是升序还是降序。

用户需传入 `List` 元素到键的映射函数。

参数：

- data: List\<T> - 需要排序的 `List`。
- key!: (T) -> K - 元素到键的映射函数。
- stable!: Bool - 是否使用稳定排序，默认为否。
- descending!: Bool - 是否使用降序排序，默认为否。
