<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-array-t-bool-bool-where-t-comparable-t" parent="std.sort.func.sort" -->
# sort<T>(Array<T>, Bool, Bool) where T <: Comparable<T>

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T>(data: Array<T>, stable!: Bool = false, descending!: Bool = false): Unit where T <: Comparable<T>
```

对数组进行排序。

## 契约

功能：对数组进行排序。可根据入参指定是否要进行稳定排序，是升序还是降序。

参数：

- data: Array\<T> - 需要排序的数组。
- stable!: Bool - 是否使用稳定排序，默认为否。
- descending!: Bool - 是否使用降序排序，默认为否。
