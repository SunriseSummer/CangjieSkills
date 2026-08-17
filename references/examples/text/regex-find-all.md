<!-- cj-doc kind="example-leaf" level="4" id="examples.text.regex-find-all" parent="examples.text" -->
# 用正则查找 Unicode 捕获组

[← 字符串、正则与文本解析](index.md)

为正则启用 Unicode 模式，遍历 `findAll` 的不重叠结果，并按组号安全读取非 ASCII 捕获组。

## 典型示例

`findAll` 返回所有不重叠匹配。读取捕获组时传入 `group: true`；模式或输入可能包含非 ASCII 字符时，
仓颉 1.1.3 应显式启用 `RegexFlag.Unicode`，避免捕获组边界按字节切分后形成无效 UTF-8。

```cangjie cjtest=run id=examples.text.regex-find-all.api.regex.findall.run form=unit timeout=20s
package regex_findall_example

import std.regex.*

main(): Unit {
    let pattern = Regex("#([\\p{L}\\p{N}_-]+)", [RegexFlag.Unicode])
    let matches = pattern.findAll("#Apple #Äpfel #東京", group: true)
    println(matches.size)
    for (item in matches) {
        println(item.matchString(1))
    }
}
```

预期标准输出：

```text cjtest=expect for=examples.text.regex-find-all.api.regex.findall.run stream=stdout match=exact
3
Apple
Äpfel
東京
```
