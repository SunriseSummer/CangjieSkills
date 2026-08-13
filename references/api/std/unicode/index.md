<!-- cj-doc kind="api-package" level="4" id="std.unicode" parent="api.std" -->
# std.unicode

[← std 包索引](../index.md)

按 Unicode 标准分类和转换字符。

包路径：`std.unicode`。在代码中只导入实际使用的类型或函数。

## 接口

| 声明 | 功能 |
|---|---|
| [`UnicodeRuneExtension`](interfaces/unicoderuneextension/index.md) | `Unicode` 字符集相关扩展的接口。 |
| [`UnicodeStringExtension`](interfaces/unicodestringextension/index.md) | 为 `String` 提供 Unicode 空白判断、裁剪及大小写转换；大小写映射可能改变 Rune 数量，应对完整字符串调用 `toLower`/`toUpper`，不要逐 Rune 拼接。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`CasingOption`](enums/casingoption/index.md) | 大小写转换时根据不同语言所需要的枚举类。 |
