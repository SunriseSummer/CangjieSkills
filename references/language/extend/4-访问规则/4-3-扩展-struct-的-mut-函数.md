<!-- cj-doc kind="guide-leaf" level="5" id="language.extend.4-访问规则.4-3-扩展-struct-的-mut-函数" parent="language.extend.4-访问规则" -->
# 4.3 扩展 struct 的 `mut` 函数

[← 4. 访问规则](index.md)

扩展结构体时，修改实例状态的成员必须声明为 `mut func`；普通函数不能改写结构体字段。

```cangjie cjtest=syntax id=syntax-9d2ffc68b8-1 form=unit
struct Counter {
    var count: Int64 = 0
}

extend Counter {
    public mut func increment() {
        count += 1
    }
}

main() {
    var c = Counter()  // 须为 var 才能调用 mut 函数
    c.increment()
    println(c.count)   // 输出：1
}
```
