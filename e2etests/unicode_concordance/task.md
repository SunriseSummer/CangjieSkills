# Unicode 词语索引

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `unicode_concordance`。把多行文本解析为 Unicode 词语，形成可查询、顺序稳定的词语索引。

实现必须使用 `String.runes()`、`std.unicode` 的 Rune 分类/大小写扩展、`StringBuilder`、`HashMap`、`HashSet` 和 `std.sort`。不得按 UTF-8 Byte 逐字节分类，也不得把逻辑限制在 ASCII；不得使用字符串 `split` 硬编码测试分隔符。

## 公开 API

```cangjie
public struct WordEntry {
    public let word: String
    public let count: Int64
    public let lines: Array<Int64>
    public init(word: String, count: Int64, lines: Array<Int64>)
}

public class UnicodeConcordance {
    public static func build(text: String): UnicodeConcordance
    public prop totalWords: Int64
    public prop uniqueWords: Int64
    public func countOf(word: String): Int64
    public func linesOf(word: String): Array<Int64>
    public func entries(): Array<WordEntry>
    public func render(): String
}
```

解析规则：

- Unicode 字母和数字都属于词语；其他 Rune 均为分隔符。
- 相邻字母/数字属于同一个词语，例如 `Cangjie42` 是一个词。
- 使用 Rune 的 Unicode 小写转换规范化字母，数字保持不变。
- 换行符开始新行，行号从 1 开始；空行仍会递增后续行号。
- `count` 统计总出现次数；`lines` 仅记录出现过的行号，每行最多一次且升序。
- 所有查询参数使用同样的 Unicode 小写规范化；不存在的词返回 0 或空数组。
- `entries()` 按规范化 `word` 的 `String` 自然顺序升序，且每次返回独立数组；每项 `lines` 也必须是独立数组。
- `render()` 每行格式为 `word=count@line1,line2`，顺序与 `entries()` 相同，最后无额外换行；空索引返回空字符串。

把随题 `unicode_concordance_test.cj` 原样放入 `src/`。`main()` 对 `"Apple apple\n仓颉 Apple42 仓颉"` 建立索引并输出：

```text
total=5
unique=3
apple=2@1
apple42=1@2
仓颉=2@2
```

验收要求 `cjpm clean/build/test/run` 全部成功，26 项测试全部通过，编译 warning 为 0。
