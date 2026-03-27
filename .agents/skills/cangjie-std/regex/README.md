# 仓颉语言正则表达式 Skill

## 1. Regex 创建

- 来自 `std.regex.*`
- 构造：`Regex(pattern)` 或 `Regex(pattern, flags)`

| RegexFlag | 说明 |
|-----------|------|
| `IgnoreCase` | 忽略大小写 |
| `MultiLine` | 多行模式（`^` `$` 匹配行首行尾） |
| `Unicode` | 启用 Unicode 匹配 |

---

## 2. 查找与匹配

| 方法 | 说明 |
|------|------|
| `regex.matches(input: String): Bool` | 完整匹配 |
| `regex.find(input: String): ?MatchData` | 查找第一个匹配 |
| `regex.find(input: String, startIndex: Int64): ?MatchData` | 从指定位置查找第一个匹配 |
| `regex.findAll(input: String): Array<MatchData>` | 查找所有匹配 |
| `regex.findAll(input: String, startIndex: Int64): Array<MatchData>` | 从指定位置查找所有匹配 |
| `regex.lazyFindAll(input: String, group!: Bool): Iterator<MatchData>` | 惰性查找所有匹配，支持分组 |

```cangjie
package test_proj
import std.regex.*

main(): Unit {
    let r = Regex("a.a")
    // find 返回 ?MatchData
    var result = r.find("1aba2 ada3")
    match (result) {
        case Some(md) =>
            println(md.matchString())
            let pos = md.matchPosition()
            println("[${pos.start}, ${pos.end})")
        case None => println("not found")
    }
    // findAll 遍历所有匹配
    for (md in r.findAll("1aba2 ada3")) {
        println(md.matchString())
        let pos = md.matchPosition()
        println("[${pos.start}, ${pos.end})")
    }
}
```

---

## 3. 替换

| 方法 | 说明 |
|------|------|
| `regex.replace(input: String, replacement: String): String` | 替换第一个匹配 |
| `regex.replace(input: String, replacement: String, index: Int64): String` | 从指定位置替换第一个匹配 |
| `regex.replaceAll(input: String, replacement: String): String` | 替换所有匹配 |
| `regex.replaceAll(input: String, replacement: String, limit: Int64): String` | 从指定位置替换所有匹配 |

```cangjie
package test_proj
import std.regex.*

main(): Unit {
    let r = Regex("\\d")
    // 替换第一个数字
    println(r.replace("a1b1c2d3f4", "X"))
    // 替换所有数字
    println(r.replaceAll("a1b1c2d3f4", "X"))
}
```

---

## 4. 分割

| 方法 | 说明 |
|------|------|
| `regex.split(input: String): Array<String>` | 按正则分割字符串 |

---

## 5. 捕获组

- **MatchData** 属性与方法：

| 方法 | 说明 |
|------|------|
| `matchString(): String` | 整体匹配字符串 |
| `matchString(groupIndex: Int64): String` | 按索引获取分组 |
| `matchString(groupName: String): String` | 按名称获取分组 |
| `matchPosition(): Position` | 整体匹配位置 |
| `matchPosition(index: Int64): Position` | 按索引获取分组位置 |
| `groupCount(): Int64` | 分组数量 |

- **Position**：`start`、`end` 属性
- `regex.getNamedGroups()` 获取命名分组映射

```cangjie
package test_proj
import std.regex.*

main(): Unit {
    var r = Regex(#"(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})"#)
    for (md in r.lazyFindAll("2024-10-24&2025-01-01", group: true)) {
        println("# found: `${md.matchString()}` and groupCount: ${md.groupCount()}")
        if (md.groupCount() > 0) {
            for (i in 0..=md.groupCount()) {
                println("group[${i}] : ${md.matchString(i)}")
                let pos = md.matchPosition(i)
                println("position : [${pos.start}, ${pos.end})")
            }
        }
        // 通过命名分组访问
        for ((name, index) in r.getNamedGroups()) {
            let pos = md.matchPosition(name)
            println("${name} 是第 ${index} 组, position: [${pos.start}, ${pos.end}), 捕获: ${md.matchString(name)}")
        }
    }
}
```

---

## 6. 异常类型

| 异常 | 说明 |
|------|------|
| `RegexException` | 正则表达式编译或匹配错误 |

---

## 7. 关键规则速查

1. `Regex(pattern)` 创建正则，`Regex(pattern, flags)` 支持标志位
2. `find` 返回 `?MatchData`，需用 `match` 或 `if-let` 解包
3. `findAll` 返回迭代器，`lazyFindAll` 惰性求值适合大文本
4. `matchString(groupIndex)` 和 `matchString(groupName)` 分别按索引和名称获取分组
5. `replace` 替换首个匹配，`replaceAll` 替换全部
6. 使用原始字符串 `#"..."#` 避免双重转义
7. `getNamedGroups()` 返回命名分组与索引的映射
