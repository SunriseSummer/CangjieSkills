<!-- cj-doc kind="guide-leaf" level="4" id="language.basic_data_type.7-nothing-类型" parent="language.basic_data_type" -->
# 7. Nothing 类型

[← 基本数据类型](index.md)

`Nothing` 不含任何值且是所有类型的子类型；`break`、`continue`、`return`、`throw` 表达式都具有该类型。

- 类型：`Nothing`
- **不包含任何值**
- 是**所有类型的子类型**（包括 `Unit`）
- 是 `break`、`continue`、`return`、`throw` 表达式的类型
- 这些表达式之后的代码不可达
- `return` 须在函数体内使用；`break`/`continue` 须在循环内使用
- 目前不能作为显式类型标注使用

---

## 典型示例

`throw` 表达式的类型是 `Nothing`，而 `Nothing` 是任意类型的子类型，因此抛异常的分支可与返回 `Int64` 的分支共同组成一个 `Int64` 表达式。

```cangjie cjtest=run id=language.nothing-branch.run form=unit timeout=20s
package nothing_branch_example

func requirePositive(value: Int64): Int64 {
    if (value > 0) {
        value
    } else {
        throw IllegalArgumentException("value must be positive")
    }
}

main(): Unit {
    println(requirePositive(7))
    try {
        requirePositive(0)
    } catch (_: IllegalArgumentException) {
        println("rejected")
    }
}
```

```text cjtest=expect for=language.nothing-branch.run stream=stdout match=exact
7
rejected
```
