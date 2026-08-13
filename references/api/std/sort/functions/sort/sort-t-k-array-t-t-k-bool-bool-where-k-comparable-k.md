<!-- cj-doc kind="api-member" level="6" id="std.sort.func.sort.sort-t-k-array-t-t-k-bool-bool-where-k-comparable-k" parent="std.sort.func.sort" -->
# sort<T, K>(Array<T>, (T) -> K, Bool, Bool) where K <: Comparable<K>

[← sort](index.md)

## 签名

```cangjie role=signature
public func sort<T, K>(data: Array<T>, key!: (T) -> K, stable!: Bool = false, descending!: Bool = false): Unit where K <: Comparable<K>
```

对数组按照指定的键（键与键之间可比较）进行排序。

## 契约

功能：对数组按照指定的键（键与键之间可比较）进行排序。可根据入参指定是否要进行稳定排序，是升序还是降序。

用户需传入数组元素到键的映射函数。

参数：

- data: Array\<T> - 需要排序的数组。
- key!: (T) -> K - 元素到键的映射函数。
- stable!: Bool - 是否使用稳定排序，默认为否。
- descending!: Bool - 是否使用降序排序，默认为否。

## 典型示例

`key` 把每个元素映射为可比较值；这里按字符串长度升序排序，并启用稳定排序保留同长度元素的相对次序。

```cangjie cjtest=run id=api.sort.key.run form=unit timeout=20s
package sort_key_example

import std.sort.*

main(): Unit {
    let names = ["Grace", "Li", "Ada"]
    sort<String, Int64>(names, key: { value => value.size }, stable: true)
    for (name in names) {
        println(name)
    }
}
```

```text cjtest=expect for=api.sort.key.run stream=stdout match=exact
Li
Ada
Grace
```
