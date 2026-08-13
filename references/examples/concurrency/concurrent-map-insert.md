<!-- cj-doc kind="example-leaf" level="4" id="examples.concurrency.concurrent-map-insert" parent="examples.concurrency" -->
# 并发映射的原子插入

[← 并发任务与同步](index.md)

用 addIfAbsent 在竞争下只建立一个值，并根据返回结果判断是否插入。

## 典型示例

`addIfAbsent` 只在键不存在时写入：成功插入返回 `None`，键已存在则返回旧值且不覆盖。这个返回值可直接判断本次调用是否取得初始化权。

```cangjie cjtest=run id=examples.concurrency.concurrent-map-insert.api.concurrent-map.add-if-absent.run form=unit timeout=20s
package concurrent_map_add_if_absent_example

import std.collection.concurrent.*

main(): Unit {
    let cache = ConcurrentHashMap<String, Int64>()

    println(cache.addIfAbsent("answer", 42) == None)
    println(cache.addIfAbsent("answer", 99).getOrThrow())
    println(cache["answer"])
}
```

预期标准输出：

```text cjtest=expect for=examples.concurrency.concurrent-map-insert.api.concurrent-map.add-if-absent.run stream=stdout match=exact
true
42
42
```
