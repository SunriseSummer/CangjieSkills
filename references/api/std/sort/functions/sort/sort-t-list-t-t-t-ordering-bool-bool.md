<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-list-t-t-t-ordering-bool-bool" parent="std.sort.func.sort" -->
# sort<T>(List<T>, (T, T) -> Ordering, Bool, Bool)

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T>(data: List<T>, by!: (T, T) -> Ordering, stable!: Bool = false, descending!: Bool = false): Unit
```

对 `List` 按照比较函数进行排序。

## 契约

功能：对 `List` 按照比较函数进行排序。可根据入参指定是否要进行稳定排序，是升序还是降序。

用户需传入自定义的比较函数 `by`。如果 `by` 的返回值为 Ordering.GT，排序后 `t1` 在 `t2` 后；如果 `by` 的返回值为 Ordering.LT，排序后 `t1` 在 `t2` 前；如果 `by` 的返回值为 Ordering.EQ，排序后 `t1` 与 `t2` 的位置与是否是稳定排序有关，稳定则较排序前保持不变，否则有可能发生改变。

参数：

- data: List\<T> - 需要排序的 `List`。
- by!: (T, T) ->Ordering - 传入的比较函数。
- stable!: Bool - 是否使用稳定排序，默认为否。
- descending!: Bool - 是否使用降序排序，默认为否。
