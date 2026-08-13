<!-- cj-doc kind="api-member" level="6" id="std.regex.class.regex.find" parent="std.regex.class.regex" -->
# Regex.find

[← Regex](index.md)

## 签名

```cangjie role=signature
public func find(input: String, group!: Bool = false): Option<MatchData>
```

查找第一个匹配到的子序列。

## 契约

参数：

- input: String - 待匹配序列。
- group!: Bool - 指定是否开启捕获组的提取。

返回值：

- Option\<MatchData> - 匹配到结果返回 Option\<MatchData>，如果匹配不到，返回 Option\<MatchData>.None。

异常：

- RegexException - 当存在匹配但提取匹配信息失败时，抛出异常。
