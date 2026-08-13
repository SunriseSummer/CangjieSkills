<!-- cj-doc kind="guide-leaf" level="5" id="language.string.7-分割.7-1-split-按分隔符分割" parent="language.string.7-分割" -->
# 7.1 `split` — 按分隔符分割

[← 7. 分割](index.md)

```cangjie cjtest=syntax id=syntax-d52e5644cc-1 form=unit
func split(str: String, removeEmpty!: Bool = false): Array<String>
func split(str: String, maxSplits: Int64, removeEmpty!: Bool = false): Array<String>
```

```cangjie cjtest=syntax id=syntax-d52e5644cc-2 form=stmt
"a,b,,c".split(",")                    // ["a", "b", "", "c"]
"a,b,,c".split(",", removeEmpty: true) // ["a", "b", "c"]
"a,b,c,d".split(",", 2)               // ["a", "b,c,d"]  — 最多返回 2 个子字符串
```

`maxSplits` 限制的是返回的子字符串数量，不是分隔动作次数：`0` 返回空数组，`1` 返回只含原字符串的数组，负数表示完整分割。

## 已验证示例

签名 `split(str: String, maxSplits: Int64, removeEmpty!: Bool = false)` 中，`maxSplits` 没有 `!`，必须按位置传入；`removeEmpty!` 才能写成命名实参。`maxSplits` 表示最多返回的子字符串数量，最后一项保留尚未分割的剩余文本。

```cangjie cjtest=run id=language.string-split-limit.run form=unit timeout=20s
package string_split_limit_example

main(): Unit {
    let parts = "a,b,c,d".split(",", 2)
    println(parts.size)
    println(parts[0])
    println(parts[1])
}
```

```text cjtest=expect for=language.string-split-limit.run stream=stdout match=exact
2
a
b,c,d
```
