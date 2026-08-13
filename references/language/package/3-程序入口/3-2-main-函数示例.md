<!-- cj-doc kind="guide-leaf" level="5" id="language.package.3-程序入口.3-2-main-函数示例" parent="language.package.3-程序入口" -->
# 3.2 `main` 函数示例

[← 3. 程序入口](index.md)

`main(): Int64`：main 函数示例。

```cangjie cjtest=syntax id=syntax-af0053f552-1 form=unit
// 无参 main，返回整数
main(): Int64 {
    return 0
}
```
```cangjie cjtest=syntax id=syntax-af0053f552-2 form=unit
// 带命令行参数的 main
main(args: Array<String>): Unit {
    for (arg in args) {
        println(arg)
    }
}
```
```cangjie cjtest=syntax id=syntax-af0053f552-3 form=unit
// ❌ 错误：返回类型不能是 String
main(): String { return "" }
```
```cangjie cjtest=syntax id=syntax-af0053f552-4 form=unit
// ❌ 错误：参数类型只能是 Array<String>
main(args: Array<Int8>): Int64 { return 0 }
```

---
