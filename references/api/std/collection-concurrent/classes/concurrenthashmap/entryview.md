<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.entryview" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.entryView

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func entryView(key: K, fn: (MapEntryView<K, V>) -> Unit): ?V
```

根据指定键 key 获取当前映射中相应的键值对视图 entryView，并调用函数 fn 对该键值对进行增、删、改操作，并返回最终映射中键 key 对应的值。

## 契约

如果当前映射中不包含键 key，则将获取一个空视图 entryView，如果将其 value 置为非 None 值，则将在当前映射中增加 key-value 键值对。

如果当前映射中包含键 key，则将获取 key-value 的视图，如果将 value 置为 None，则相当于从当前映射中删除该键值对；如果将 value 置为新的非 None 值，则相当于修改当前映射中键 key 对应的值。

注意参数 fn 中不能并发调用函数 entryView、remove、replace，如：

> **说明：**
>
> - 该操作具有原子性。
>
> - 回调 fn 调用过程中对 key-value 键值对的修改不会即时更新到当前映射中，等到 entryView 函数调用结束再将修改整体更新到当前映射中。

参数：

- key: K - 待获取其相应视图的键。
- fn: (MapEntryView\<K, V>) -> Unit - 对指定视图进行的自定义操作，可用于对映射中键值对进行增、删、改操作。

返回值：

- ?V - 函数 fn 调用结束后当前映射中键 key 对应的值，如果 key 不存在，返回 None。
