<!-- cj-doc kind="example-leaf" level="4" id="examples.functions.nested-function" parent="examples.functions" -->
# 返回捕获不可变环境的嵌套函数

[← 函数、闭包与运算符](index.md)

嵌套函数可读取外围参数并作为函数值返回，形成保留不可变环境的闭包。

## 典型示例

嵌套函数只在外围函数中可见，可以读取外围函数的参数，也可以作为函数值返回；返回后形成的闭包会保留所捕获的不可变环境。

```cangjie cjtest=run id=examples.functions.nested-function.language.nested-function.run form=unit timeout=20s
package nested_function_example

func makeOffset(offset: Int64): (Int64) -> Int64 {
    func add(value: Int64): Int64 {
        value + offset
    }
    return add
}

main(): Unit {
    let addThree = makeOffset(3)
    println(addThree(4))
}
```

预期标准输出：

```text cjtest=expect for=examples.functions.nested-function.language.nested-function.run stream=stdout match=exact
7
```
