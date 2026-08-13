<!-- cj-doc kind="example-leaf" level="4" id="examples.functions.index-operator" parent="examples.functions" -->
# 实现下标读取与赋值

[← 函数、闭包与运算符](index.md)

分别声明取值和带 value 命名参数的赋值重载，让类型支持普通下标语法。

## 已验证示例

索引取值重载只接收位置参数；赋值重载额外声明一个名为 `value` 的命名参数，调用时仍写作普通下标赋值。

```cangjie cjtest=run id=examples.functions.index-operator.language.index-operator.run form=unit timeout=20s
package index_operator_example

class Scores {
    let values = [10, 20, 30]

    public operator func [](index: Int64): Int64 {
        return values[index]
    }

    public operator func [](index: Int64, value!: Int64): Unit {
        values[index] = value
    }
}

main(): Unit {
    let scores = Scores()
    scores[1] = 99
    println(scores[1])
}
```

预期标准输出：

```text cjtest=expect for=examples.functions.index-operator.language.index-operator.run stream=stdout match=exact
99
```
