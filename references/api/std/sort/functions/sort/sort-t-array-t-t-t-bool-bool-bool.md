<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-array-t-t-t-bool-bool-bool" parent="std.sort.func.sort" -->
# sort<T>(Array<T>, (T, T) -> Bool, Bool, Bool)

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T>(data: Array<T>, lessThan!: (T, T) -> Bool, stable!: Bool = false, descending!: Bool = false): Unit
```

对数组按照比较函数进行排序。

## 契约

功能：对数组按照比较函数进行排序。可根据入参指定是否要进行稳定排序，是升序还是降序。

用户需传入自定义的比较函数 `lessThan`。如果 `lessThan` 的返回值为 `true`，排序后 `t1` 在 `t2` 前；如果 `lessThan` 的返回值为`false`，又会分为两种情况，如果 `t1` 和 `t2` 不相等，排序后 `t1` 在 `t2` 后，如果相等，`t1` 与 `t2` 的前后位置关系与是否是稳定排序有关，稳定则较排序前保持不变，否则有可能发生改变。

参数：

- data: Array\<T> - 需要排序的数组。
- lessThan!: (T, T) ->Bool - 传入的比较函数。
- stable!: Bool - 是否使用稳定排序，默认为否。
- descending!: Bool - 是否使用降序排序，默认为否。
