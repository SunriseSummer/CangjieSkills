<!-- cj-doc kind="example-leaf" level="4" id="examples.collections.hashmap-counting" parent="examples.collections" -->
# 用 HashMap 统计词频

[← 集合查找、统计与排序](index.md)

从 get 返回的 Option 读取旧值，再覆盖写回累计结果。

## 已验证计数示例

计数时用 `get` 区分已有键与新键，再用下标赋值统一写回；不要依赖 `HashMap` 的遍历顺序。

```cangjie cjtest=run id=language.hashmap-counting.run form=unit timeout=20s
package hashmap_counting_example

import std.collection.*

main(): Unit {
    let counts = HashMap<String, Int64>()
    for (word in ["red", "blue", "red"]) {
        match (counts.get(word)) {
            case Some(count) => counts[word] = count + 1
            case None => counts[word] = 1
        }
    }
    println(counts["red"])
    println(counts["blue"])
}
```

预期标准输出：

```text cjtest=expect for=language.hashmap-counting.run stream=stdout match=exact
2
1
```
