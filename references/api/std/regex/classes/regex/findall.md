<!-- cj-doc kind="api-member" level="6" id="std.regex.class.regex.findall" parent="std.regex.class.regex" -->
# Regex.findAll

[← Regex](index.md)

## 签名

```cangjie role=signature
public func findAll(input: String, group!: Bool = false): Array<MatchData>
```

对整个输入序列进行匹配，查找所有匹配到的子序列。

## 契约

参数：

- input: String - 待匹配序列。
- group!: Bool - 指定是否开启捕获组的提取。

返回值：

- Array\<MatchData> - 存储匹配结果的数组，如果未匹配到，数组为空。

异常：

- RegexException - 当存在匹配但提取匹配信息失败时，抛出异常。

## 典型示例

`findAll` 返回所有不重叠匹配。读取捕获组时传入 `group: true`；模式或输入可能包含非 ASCII 字符时，
仓颉 1.0.5 应显式启用 `RegexFlag.Unicode`，避免捕获组边界按字节切分后形成无效 UTF-8。

```cangjie cjtest=run id=api.regex.findall.run form=unit timeout=20s
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

```text cjtest=expect for=api.regex.findall.run stream=stdout match=exact
3
Apple
Äpfel
東京
```
