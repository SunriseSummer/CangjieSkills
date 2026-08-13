<!-- cj-doc kind="guide-index" level="4" id="language.string.4-静态方法" parent="language.string" -->
# 4. 静态方法

[← String](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 `join` — 拼接字符串数组](4-1-join-拼接字符串数组.md) | `static func join(strArr: Array<String>, delimiter!: String = String.empty): String`：拼接字符串数组。 |
| [4.2 `fromUtf8` — 从 UTF-8 字节数组构造](4-2-fromutf8-从-utf-8-字节数组构造.md) | 校验字节数组是否为合法 UTF-8，非法则抛出 `IllegalArgumentException` |
| [4.3 `fromUtf8Unchecked` — 不校验构造（unsafe）](4-3-fromutf8unchecked-不校验构造-unsafe.md) | 不校验 UTF-8 合法性，性能更好但使用不当会导致未定义行为 |
| [4.4 `checkUtf8Encoding` — 校验 UTF-8 合法性](4-4-checkutf8encoding-校验-utf-8-合法性.md) | `static func checkUtf8Encoding(data: Array<UInt8>): Bool`：校验 UTF-8 合法性。 |
