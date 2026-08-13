<!-- cj-doc kind="example-leaf" level="4" id="examples.data-model.recursive-enum" parent="examples.data-model" -->
# 用递归枚举表达式树

[← 值类型、枚举与模式匹配](index.md)

用带负载构造器建立递归结构，并以穷举 match 递归求值。

## 已验证示例

递归枚举适合表示树形数据；求值函数必须覆盖每个构造器，并递归处理其负载。`case` 的多语句分支直接在 `=>` 后换行书写，最后一个表达式是分支值；不要添加 `{}`，否则会被解析为 Lambda。

```cangjie cjtest=run id=examples.data-model.recursive-enum.language.recursive-enum.run form=unit timeout=20s
package recursive_enum_example

enum Expr {
    | Num(Int64)
    | Add(Expr, Expr)
    | Neg(Expr)
}

func evaluate(expr: Expr): Int64 {
    return match (expr) {
        case Num(value) => value
        case Add(left, right) =>
            let sum = evaluate(left) + evaluate(right)
            sum
        case Neg(value) => -evaluate(value)
    }
}

main(): Unit {
    let expression = Add(Num(7), Neg(Num(2)))
    println(evaluate(expression))
}
```

预期标准输出：

```text cjtest=expect for=examples.data-model.recursive-enum.language.recursive-enum.run stream=stdout match=exact
5
```
