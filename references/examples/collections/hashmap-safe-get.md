<!-- cj-doc kind="example-leaf" level="4" id="examples.collections.hashmap-safe-get" parent="examples.collections" -->
# 安全读取 HashMap

[← 集合查找、统计与排序](index.md)

区分键不存在与已有值，使用模式匹配或默认值消费 Option。

## 典型示例

`get` 用 `Option<V>` 区分“键不存在”和实际值；调用方应显式处理 `Some` 与 `None`。

```cangjie cjtest=run id=examples.collections.hashmap-safe-get.api.hashmap.get.run form=unit timeout=20s
package hashmap_get_example

import std.collection.*

main(): Unit {
    let scores = HashMap<String, Int64>()
    scores.add("Ada", 95)

    match (scores.get("Ada")) {
        case Some(score) => println(score)
        case None => println("missing")
    }
    println(scores.get("Grace") == None)
}
```

预期标准输出：

```text cjtest=expect for=examples.collections.hashmap-safe-get.api.hashmap.get.run stream=stdout match=exact
95
true
```
