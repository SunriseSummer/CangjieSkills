<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.1-从仓颉调用-c.1-1-foreign-函数声明" parent="language.cffi.overview.1-从仓颉调用-c" -->
# 1.1 foreign 函数声明

[← 1. 从仓颉调用 C](index.md)

使用 `@C` 和 `foreign` 修饰符，结合仓颉函数语法声明 C 函数，`@C` 修饰符可省略。调用时须在 `unsafe {}` 块中。

```cangjie cjtest=syntax id=syntax-3111c6699a-1 form=stmt
@C
foreign func rand(): Int32
foreign func printf(fmt: CString, ...): Int32  // 变长参数用 ... 表示，须在参数列表末尾

main() {
    let r = unsafe { rand() }
    println("random number ${r}")
    unsafe {
        var fmt = LibC.mallocCString("Hello, No.%d\n")
        printf(fmt, 1)
        LibC.free(fmt)
    }
}
```

规则：

- `foreign` 函数只是声明，不涉及函数体
- 参数和返回类型须满足 `CType` 约束
- 不支持命名参数和参数默认值
- 变长参数（`...`）的各实参须满足 `CType` 约束，但不必是同一类型
- `@C` 只支持修饰 `foreign` 函数、顶层非泛型函数和 `struct`

可使用 `foreign` 块批量声明多个外部函数：

```cangjie cjtest=syntax id=syntax-3111c6699a-2 form=unit
foreign {
    func rand(): Int32
    func printf(fmt: CString, ...): Int32
    func malloc(size: UIntNative): CPointer<Unit>
    func free(ptr: CPointer<Unit>): Unit
}
```
