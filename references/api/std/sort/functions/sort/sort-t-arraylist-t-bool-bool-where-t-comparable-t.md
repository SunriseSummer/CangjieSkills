<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-arraylist-t-bool-bool-where-t-comparable-t" parent="std.sort.func.sort" -->
# sort<T>(ArrayList<T>, Bool, Bool) where T <: Comparable<T>

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T>(data: ArrayList<T>, stable!: Bool = false, descending!: Bool = false): Unit where T <: Comparable<T>
```

对 `ArrayList<T>` 原地排序，但仅适用于 `T <: Comparable<T>`；元组或未实现 Comparable 的记录应改用 `key!`、`lessThan!` 或 `by!` 重载。

## 契约

类型约束：

- 该重载要求元素类型 `T` 实现 `Comparable<T>`，并直接修改传入的 `ArrayList`。
- 元组本身不满足此约束；自定义记录也只有在显式实现或派生 Comparable 后才能使用本重载。
- 只需按某个字段排序时优先使用 `key!` 重载；需要完整比较逻辑时使用 `lessThan!` 或 `by!` 重载。
