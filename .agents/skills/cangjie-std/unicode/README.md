# 仓颉语言 Unicode 字符处理 Skill

## 1. Rune 字符分类

- 来自 `std.unicode.*`
- `UnicodeRuneExtension` 扩展接口，为 `Rune` 类型添加 Unicode 分类方法

| 方法 | 说明 |
|------|------|
| `isLetter(): Bool` | 是否为字母（包括中文等） |
| `isNumber(): Bool` | 是否为数字 |
| `isLowerCase(): Bool` | 是否为小写字母 |
| `isUpperCase(): Bool` | 是否为大写字母 |
| `isTitleCase(): Bool` | 是否为标题大小写 |
| `isWhiteSpace(): Bool` | 是否为空白字符 |

```cangjie
package test_proj
import std.unicode.*

main() {
    let ch: Rune = r"A"
    println(ch.isLetter())
    println(ch.isUpperCase())
    println(ch.toLowerCase())

    let digit: Rune = r"5"
    println(digit.isNumber())

    let space: Rune = r" "
    println(space.isWhiteSpace())
}
```

---

## 2. 大小写转换

- `UnicodeRuneExtension` 提供大小写转换方法

| 方法 | 说明 |
|------|------|
| `toLowerCase(): Rune` | 转小写 |
| `toUpperCase(): Rune` | 转大写 |
| `toTitleCase(): Rune` | 转标题大小写 |

- `UnicodeStringExtension` 为 `String` 提供类似方法

| 方法 | 说明 |
|------|------|
| `toLowerCase(): String` | 字符串整体转小写 |
| `toUpperCase(): String` | 字符串整体转大写 |
| `isLetter(): Bool` | 是否全部为字母 |
| `isNumber(): Bool` | 是否全部为数字 |
| `isWhiteSpace(): Bool` | 是否全部为空白 |

---

## 3. 语言特定转换

- `CasingOption` 枚举，用于语言相关的大小写转换

| 枚举值 | 语言 |
|--------|------|
| `TR` | 土耳其语 |
| `AZ` | 阿塞拜疆语 |
| `LT` | 立陶宛语 |
| `Other` | 默认规则 |

- 调用方式：`ch.toLowerCase(CasingOption.TR)`
- 土耳其语中 `I` → `ı`（无点小写 i），与默认规则不同

---

## 4. 关键规则速查

1. `isLetter()` 覆盖所有 Unicode 字母类别（含 CJK 字符）
2. `toLowerCase()` / `toUpperCase()` 默认使用 Unicode 通用规则
3. 需要语言特定转换时使用 `CasingOption` 参数（如土耳其语 I/İ 问题）
4. `UnicodeStringExtension` 为 `String` 提供整体字符串级别的分类和转换
5. Rune 字面量使用 `r"字符"` 语法
