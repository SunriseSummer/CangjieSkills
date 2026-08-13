<!-- cj-doc kind="api-member" level="6" id="std.regex.class.regex.lazyfindall" parent="std.regex.class.regex" -->
# Regex.lazyFindAll

[← Regex](index.md)

## 签名

```cangjie role=signature
public func lazyFindAll(input: String, group!: Bool = false): Iterator<MatchData>
```

对整个输入序列进行匹配，获取匹配的迭代器。

## 契约

参数：

- input: String - 待匹配序列。
- group!: Bool - 指定是否开启捕获组的提取。

返回值：

- Iterator\<MatchData> - 匹配的迭代器。
