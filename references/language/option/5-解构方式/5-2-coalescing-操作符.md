<!-- cj-doc kind="guide-leaf" level="5" id="language.option.5-解构方式.5-2-coalescing-操作符" parent="language.option.5-解构方式" -->
# 5.2 coalescing 操作符 `??`

[← 5. 解构方式](index.md)

`e1 ?? e2`：当 `e1` 为 `Some(v)` 时返回 `v`，否则返回 `e2`。`e2` 具有短路求值特性（`e1` 有值时不求值 `e2`）。
```cangjie cjtest=syntax id=syntax-0f8a46b23e-1 form=unit
main() {
    let a = Some(1)
    let b: ?Int64 = None
    let r1: Int64 = a ?? 0   // 1
    let r2: Int64 = b ?? 0   // 0
    println("${r1}, ${r2}")   // "1, 0"
}
```

> **注意**：`??` 的优先级低于比较运算符，混合使用时需加括号，详见[基本数据类型](../../basic_data_type/index.md)。
