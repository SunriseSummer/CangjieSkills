<!-- cj-doc kind="example-leaf" level="4" id="examples.text.split-limit" parent="examples.text" -->
# 限制 String.split 的返回项数

[← 字符串、正则与文本解析](index.md)

maxSplits 表示最多返回的子字符串数量；达到上限后，最后一项保留尚未分割的剩余文本。

## 已验证示例

签名 `split(str: String, maxSplits: Int64, removeEmpty!: Bool = false)` 中，`maxSplits` 没有 `!`，必须按位置传入；`removeEmpty!` 才能写成命名实参。`maxSplits` 表示最多返回的子字符串数量，最后一项保留尚未分割的剩余文本。

```cangjie cjtest=run id=examples.text.split-limit.language.string-split-limit.run form=unit timeout=20s
package string_split_limit_example

main(): Unit {
    let parts = "a,b,c,d".split(",", 2)
    println(parts.size)
    println(parts[0])
    println(parts[1])
}
```

预期标准输出：

```text cjtest=expect for=examples.text.split-limit.language.string-split-limit.run stream=stdout match=exact
2
a
b,c,d
```
