<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-list-t-bool-bool-where-t-comparable-t" parent="std.sort.func.sort" -->
# sort<T>(List<T>, Bool, Bool) where T <: Comparable<T>

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T>(data: List<T>, stable!: Bool = false, descending!: Bool = false): Unit where T <: Comparable<T>
```

对 `List` 进行排序。

## 契约

功能：对 `List` 进行排序。可根据入参指定是否要进行稳定排序，是升序还是降序。

参数：

- data: List\<T> - 需要排序的 `List`。

- stable!: Bool - 是否使用稳定排序，默认为否。
- descending!: Bool - 是否使用降序排序，默认为否。
