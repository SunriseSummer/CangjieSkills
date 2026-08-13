<!-- cj-doc kind="guide-index" level="4" id="language.string.14-下标访问与切片" parent="language.string" -->
# 14. 下标访问与切片

[← String](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [14.1 按字节索引](14-1-按字节索引.md) | 注意：`s[i]` 返回的是 `Byte`（UTF-8 编码字节），对于多字节字符（如中文），单个索引不能获取完整字符。 |
| [14.2 切片](14-2-切片.md) | 注意：切片范围基于字节索引，确保不要在多字节字符中间切断。 |
