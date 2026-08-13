<!-- cj-doc kind="example-leaf" level="4" id="examples.functions.default-parameters" parent="examples.functions" -->
# 设计命名默认参数

[← 函数、闭包与运算符](index.md)

默认值只放在命名参数上；调用方可省略参数，也可按名称无序覆盖。

## 已验证示例

默认值只能声明在命名参数上；调用时既可省略，也可按名称覆盖，并且命名参数不受调用顺序限制。

```cangjie cjtest=run id=examples.functions.default-parameters.language.default-parameters.run form=unit timeout=20s
package default_parameters_example

func wrap(value: String, prefix!: String = "[", suffix!: String = "]"): String {
    return prefix + value + suffix
}

main(): Unit {
    println(wrap("Cangjie"))
    println(wrap("Cangjie", suffix: ">", prefix: "<"))
}
```

预期标准输出：

```text cjtest=expect for=examples.functions.default-parameters.language.default-parameters.run stream=stdout match=exact
[Cangjie]
<Cangjie>
```
