<!-- cj-doc kind="example-leaf" level="4" id="examples.data-model.struct-mut" parent="examples.data-model" -->
# 用 mut 成员修改结构体副本

[← 值类型、枚举与模式匹配](index.md)

mut 成员可原地修改 var 实例；结构体赋值仍是值拷贝，副本修改不影响原值。

## 已验证示例

`mut` 成员可原地修改 `var` 声明的结构体实例；结构体赋值仍是值拷贝，修改副本不会改变原值。

```cangjie cjtest=run id=examples.data-model.struct-mut.language.struct-mut.run form=unit timeout=20s
package struct_mut_example

struct Counter {
    var value: Int64

    public init(value: Int64) {
        this.value = value
    }

    public mut func add(delta: Int64): Unit {
        value += delta
    }
}

main(): Unit {
    var original = Counter(10)
    var copy = original
    copy.add(5)
    println(original.value)
    println(copy.value)
}
```

预期标准输出：

```text cjtest=expect for=examples.data-model.struct-mut.language.struct-mut.run stream=stdout match=exact
10
15
```
