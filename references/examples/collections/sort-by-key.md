<!-- cj-doc kind="example-leaf" level="4" id="examples.collections.sort-by-key" parent="examples.collections" -->
# 按派生键稳定排序

[← 集合查找、统计与排序](index.md)

把比较规则集中到键提取函数，使排序调用保持简洁和可读。

## 典型示例

`key` 把每个元素映射为可比较值；这里按字符串长度升序排序，并启用稳定排序保留同长度元素的相对次序。

```cangjie cjtest=run id=examples.collections.sort-by-key.api.sort.key.run form=unit timeout=20s
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

预期标准输出：

```text cjtest=expect for=examples.collections.sort-by-key.api.sort.key.run stream=stdout match=exact
Li
Ada
Grace
```
