<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.set" parent="std.collection" -->
# Set<T>

[← std.collection](../../index.md)

`Set<T> <: ReadOnlySet<T>`

Set 接口提供了一组集合的相关操作，允许我们以可读写的方式操作内部元素。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(all!: Collection<T>): Unit`](add.md) | 添加 Collection 中的所有元素至此 Set 中，如果元素存在，则不添加。 |
| [`add(element: T): Bool`](add.md) | 添加元素操作。 |
| [`clear(): Unit`](clear.md) | 清除所有键值对。 |
| [`remove(all!: Collection<T>): Unit`](remove.md) | 移除此 Set 中那些也包含在指定 Collection 中的所有元素。 |
| [`remove(element: T): Bool`](remove.md) | 从该集合中移除指定元素（如果存在）。 |
| [`removeIf(predicate: (T) -> Bool): Unit`](removeif.md) | 传入 lambda 表达式，如果满足 `true` 条件，则删除对应的元素。 |
| [`retain(all!: Set<T>): Unit`](retain.md) | 仅保留该 Set 与入参 Set 中重复的元素。 |
