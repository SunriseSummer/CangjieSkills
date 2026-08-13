<!-- cj-doc kind="guide-topic" level="3" id="language.string" parent="language" -->
# String

[← 语言特性](../index.md)

构造、查找、替换、分割、裁剪、编码、下标与迭代。

| 规则/任务 | 摘要 |
|---|---|
| [1. 概述](1-概述.md) | `String` 是仓颉核心包 `std.core` 中的 struct 类型，无需导入 即可直接使用。 |
| [2. 构造](2-构造.md) | `let s1 = ""`：构造。 |
| [3. 属性](3-属性.md) | `let s = "Hello"`：属性。 |
| [4. 静态方法](4-静态方法/index.md) | 校验字节数组是否为合法 UTF-8，非法则抛出 `IllegalArgumentException` |
| [5. 搜索与检查](5-搜索与检查/index.md) | 子页分别说明contains — 包含子串、startsWith / endsWith — 前缀/后缀检查、indexOf — 查找首次出现位置、lastIndexOf — 查找最后出现位置、count — 统计子串出现次数等。 |
| [6. 替换与删除](6-替换与删除/index.md) | 如果字符串不以指定前缀/后缀开头/结尾，返回原字符串 |
| [7. 分割](7-分割/index.md) | `maxSplits` 限制的是返回的子字符串数量，不是分隔动作次数：`0` 返回空数组，`1` 返回只含原字符串的数组，负数表示完整分割。 |
| [8. 裁剪（Trim）](8-裁剪-trim/index.md) | 子页分别说明ASCII 空白裁剪、自定义裁剪。 |
| [9. 填充（Pad）](9-填充-pad.md) | `totalWidth` 为目标字节宽度 |
| [10. 大小写转换](10-大小写转换.md) | `func toAsciiLower(): String // 转小写（仅 ASCII 字母）`：大小写转换。 |
| [11. 比较](11-比较/index.md) | 字符串可用 `==`/`!=` 判断相等，并用 `<`、`<=`、`>`、`>=` 按字符序列进行区分大小写的字典序比较。 |
| [12. 拼接与重复](12-拼接与重复/index.md) | 大量拼接时建议使用 `StringBuilder`。 |
| [13. 转换](13-转换/index.md) | 子页分别说明转为字节数组、转为 Rune 数组、迭代、toString、hashCode。 |
| [14. 下标访问与切片](14-下标访问与切片/index.md) | 注意：`s[i]` 返回的是 `Byte`（UTF-8 编码字节），对于多字节字符（如中文），单个索引不能获取完整字符。 |
| [15. `clone`](15-clone.md) | 返回字符串的一份拷贝（由于 `String` 是不可变类型，通常不需要手动克隆） |
| [16. 常见用法总结](16-常见用法总结.md) | 典型字符串流程包括判空、安全搜索、分割重组、空白裁剪、前后缀处理和重复生成。 |
