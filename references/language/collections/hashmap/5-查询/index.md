<!-- cj-doc kind="guide-index" level="5" id="language.collections.hashmap.5-查询" parent="language.collections.hashmap" -->
# 5. 查询

[← HashMap 类型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [5.1 下标访问](5-1-下标访问.md) | 键不存在抛出 `NoneValueException` |
| [5.2 安全访问 `get`](5-2-安全访问-get.md) | `func get(key: K): Option<V>`：安全访问 get。 |
| [5.3 `contains` — 键是否存在](5-3-contains-键是否存在.md) | `func contains(key: K): Bool`：键是否存在。 |
| [5.4 `keys` / `values` / `toArray`](5-4-keys-values-toarray.md) | `func keys(): EquatableCollection<K> // 所有键`：keys / values / toArray。 |
| [5.5 `entryView` — 获取条目引用视图](5-5-entryview-获取条目引用视图.md) | 返回指定键的引用视图，键不存在时返回空视图 |
