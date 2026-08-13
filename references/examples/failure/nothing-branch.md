<!-- cj-doc kind="example-leaf" level="4" id="examples.failure.nothing-branch" parent="examples.failure" -->
# 利用 Nothing 统一返回与抛出分支

[← 可选值、异常与资源管理](index.md)

throw 表达式可与具体返回值组成同一类型的 if 或 match 表达式。

## 典型示例

`throw` 表达式的类型是 `Nothing`，而 `Nothing` 是任意类型的子类型，因此抛异常的分支可与返回 `Int64` 的分支共同组成一个 `Int64` 表达式。

```cangjie cjtest=run id=examples.failure.nothing-branch.language.nothing-branch.run form=unit timeout=20s
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

预期标准输出：

```text cjtest=expect for=examples.failure.nothing-branch.language.nothing-branch.run stream=stdout match=exact
7
rejected
```
