<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-arraylist-t-t-t-bool-bool-bool" parent="std.sort.func.sort" -->
# sort<T>(ArrayList<T>, (T, T) -> Bool, Bool, Bool)

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T>(data: ArrayList<T>, lessThan!: (T, T) -> Bool, stable!: Bool = false, descending!: Bool = false): Unit
```

用 `lessThan!(left, right)` 对任意元素类型的 `ArrayList<T>` 原地排序；比较器返回 `left` 是否应排在 `right` 前，适合元组和未实现 Comparable 的记录。

## 契约

比较器契约：

- `lessThan!(left, right)` 返回 `left` 是否应排在 `right` 前；该重载不要求元素类型实现 Comparable。
- 函数直接修改传入的 `ArrayList`，无返回数组。
- 对元组可按编译期下标读取字段，例如 `sort(rows, lessThan: {a, b => a[0] < b[0]})`。需要保留等价元素原顺序时传 `stable: true`。
