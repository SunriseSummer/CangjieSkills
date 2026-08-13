<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.addifabsent" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.addIfAbsent

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func addIfAbsent(key: K, value: V): ?V
```

当此 ConcurrentHashMap 中不存在键 key 时，在 ConcurrentHashMap 中添加指定的值 value 与指定的键 key 的关联。

## 契约

功能：当此 ConcurrentHashMap 中不存在键 key 时，在 ConcurrentHashMap 中添加指定的值 value 与指定的键 key 的关联。如果 ConcurrentHashMap 已经包含键 key，则不执行赋值操作。

参数：

- key: K - 要放置的键。
- value: V - 要分配的值。

返回值：

- ?V - 如果赋值之前 key 存在，则返回当前 key 对应的值 Some(V)，且不执行赋值操作；当赋值前 key 不存在时，返回 None。

## 典型示例

`addIfAbsent` 只在键不存在时写入：成功插入返回 `None`，键已存在则返回旧值且不覆盖。这个返回值可直接判断本次调用是否取得初始化权。

```cangjie cjtest=run id=api.concurrent-map.add-if-absent.run form=unit timeout=20s
package concurrent_map_add_if_absent_example

import std.collection.concurrent.*

main(): Unit {
    let cache = ConcurrentHashMap<String, Int64>()

    println(cache.addIfAbsent("answer", 42) == None)
    println(cache.addIfAbsent("answer", 99).getOrThrow())
    println(cache["answer"])
}
```

```text cjtest=expect for=api.concurrent-map.add-if-absent.run stream=stdout match=exact
true
42
42
```
