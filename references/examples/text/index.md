<!-- cj-doc kind="example-category" level="3" id="examples.text" parent="examples" -->
# 字符串、正则与文本解析

[← 应用示例](../index.md)

分割字符串、查找 Unicode 正则捕获组，并把带进制文本解析为整数。

| 示例 | 教学目标 |
|---|---|
| [限制 String.split 的返回项数](split-limit.md) | maxSplits 表示最多返回的子字符串数量；达到上限后，最后一项保留尚未分割的剩余文本。 |
| [用正则查找 Unicode 捕获组](regex-find-all.md) | 为正则启用 Unicode 模式，遍历 `findAll` 的不重叠结果，并按组号安全读取非 ASCII 捕获组。 |
| [解析带进制的整数](int64-parse.md) | 调用 Parsable.parse，并对非法文本处理异常，而不是依赖隐式转换。 |
| [格式化定宽数值表格](numeric-format-table.md) | 组合 width、precision 和对齐标志，生成列宽稳定的整数与浮点文本。 |
| [按 Unicode 字符处理文本与码点](rune-code-point.md) | 用 r 前缀书写 Rune、用 runes() 按字符迭代；比较可直接进行，算术须先转换为 UInt32。 |
