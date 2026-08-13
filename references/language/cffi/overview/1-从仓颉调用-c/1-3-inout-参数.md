<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.1-从仓颉调用-c.1-3-inout-参数" parent="language.cffi.overview.1-从仓颉调用-c" -->
# 1.3 inout 参数

[← 1. 从仓颉调用 C](index.md)

调用 `CFunc` 时，用 `inout` 修饰实参变量，自动取变量地址转为 `CPointer<T>` 传递：

```cangjie cjtest=syntax id=syntax-cb9d200439-1 form=stmt
@C
struct Point {
    var x: Int32 = 0
    var y: Int32 = 0
}

foreign func f(ptr: CPointer<Int32>): Unit
foreign func g(ptr: CPointer<Point>): Unit

main() {
    var n: Int32 = 42 // 值类型，存储在栈上
    unsafe { f(inout n) }  // 取 n 的地址作为 CPointer<Int32> 传递

    var pt = Point() // 值类型，存储在栈上
    unsafe {
        g(inout pt) // 取结构体指针
        f(inout pt.x) // 取结构体可变成员变量的指针
    }
}
```

约束：

- 仅用于 `CFunc` 调用处
- 修饰对象须满足 `CType` 约束，且不能是 `CString`
- 修饰对象只能是 `var` 定义的可变变量（传递指针，可变语义），不能是不可变变量、字面量或临时值
- 不能直接或间接来源于 `class` 实例成员变量
- 指针仅在函数调用期间有效，C 侧不应保存该指针留作后用
