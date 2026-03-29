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

---

## 2. Rune 大小写转换

| 方法 | 说明 |
|------|------|
| `toLowerCase(): Rune` | 转小写 |
| `toUpperCase(): Rune` | 转大写 |
| `toTitleCase(): Rune` | 转标题大小写 |

```cangjie
package test_proj
import std.unicode.*

main() {
    let ch: Rune = r"A"
    println(ch.isLetter())        // true
    println(ch.isUpperCase())     // true
    println(ch.toLowerCase())     // a

    let digit: Rune = r"5"
    println(digit.isNumber())     // true

    let space: Rune = r" "
    println(space.isWhiteSpace()) // true
}
```

---

## 3. String 级别的 Unicode 操作

- `UnicodeStringExtension` 为 `String` 提供整体字符串级别的操作

| 方法 | 说明 |
|------|------|
| `toLower(): String` | 字符串整体转小写 |
| `toUpper(): String` | 字符串整体转大写 |
| `toTitle(): String` | 字符串转标题大小写 |
| `isBlank(): Bool` | 是否为空或仅包含空白字符 |
| `trim(): String` | 去除首尾空白字符 |
| `trimStart(): String` | 去除开头空白字符 |
| `trimEnd(): String` | 去除结尾空白字符 |

> **注意**：String 方法名为 `toLower()` / `toUpper()`，与 Rune 的 `toLowerCase()` / `toUpperCase()` 不同。

```cangjie
package test_proj
import std.unicode.*

main() {
    let text = "Hello, 仓颉!"
    println(text.toLower())       // hello, 仓颉!
    println(text.toUpper())       // HELLO, 仓颉!
    println("  hello  ".trim())   // hello
    println("  hello".isBlank())  // false
    println("   ".isBlank())      // true
}
```

---

## 4. 语言特定转换

- `CasingOption` 枚举，用于语言相关的大小写转换

| 枚举值 | 语言 |
|--------|------|
| `TR` | 土耳其语 |
| `AZ` | 阿塞拜疆语 |
| `LT` | 立陶宛语 |
| `Other` | 默认规则 |

- Rune 调用方式：`ch.toLowerCase(CasingOption.TR)`
- String 调用方式：`str.toLower(CasingOption.TR)`
- 土耳其语中 `I` → `ı`（无点小写 i），与默认规则不同

---

## 5. 关键规则速查

1. `isLetter()` 覆盖所有 Unicode 字母类别（含 CJK 字符），仅 Rune 可用
2. Rune 使用 `toLowerCase()` / `toUpperCase()`，String 使用 `toLower()` / `toUpper()`（注意名称差异）
3. 需要语言特定转换时使用 `CasingOption` 参数（如土耳其语 I/İ 问题）
4. `String.isBlank()` 检查是否为空或仅含空白字符
5. `String.trim()` / `trimStart()` / `trimEnd()` 去除空白字符
6. Rune 字面量使用 `r"字符"` 语法
