<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.get" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.get

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func get(key: K): ?V
```

返回指定键映射到的值，如果 HashMap 不包含指定键的映射，则返回 Option<V>.None。

## 契约

参数：

- key: K - 传入的键。

返回值：

- ?V - 键对应的值。用 Option 封装。

## 典型示例

`get` 用 `Option<V>` 区分“键不存在”和实际值；调用方应显式处理 `Some` 与 `None`。

```cangjie cjtest=run id=api.hashmap.get.run form=unit timeout=20s
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

```text cjtest=expect for=api.hashmap.get.run stream=stdout match=exact
95
true
```
