<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.1-从仓颉调用-c.1-2-cfunc-类型" parent="language.cffi.overview.1-从仓颉调用-c" -->
# 1.2 CFunc 类型

[← 1. 从仓颉调用 C](index.md)

`CFunc` 类型用来映射 C 的函数指针，函数实体可能在 C 侧或仓颉侧定义，但两侧都能调用这类函数，有三种方式声明/定义：

```cangjie cjtest=syntax id=syntax-a35ca662e9-1 form=unit
// 形式 1：@C foreign 声明的外部 C 函数，定义在 C 侧
foreign func free(ptr: CPointer<Int8>): Unit

// 形式 2：@C 修饰的仓颉函数，定义在仓颉侧
@C
func callableInC(ptr: CPointer<Int8>) {
    println("defined in Cangjie")
}

// 形式 3：CFunc Lambda，定义在仓颉侧，不能捕获变量
let f1: CFunc<(CPointer<Int8>) -> Unit> = { ptr =>
    println("CFunc lambda")
}
```

以上三个示例函数的类型均为 `CFunc<(CPointer<Int8>) -> Unit>`。

`CFunc` 的参数和返回类型须满足 `CType` 约束，调用时须在 `unsafe` 上下文中。

CFunc 和 CPointer 互转：

```cangjie cjtest=syntax id=syntax-a35ca662e9-2 form=stmt
// CPointer<T> → CFunc 其中 T <: CType
var ptr: CPointer<Int8> = getXXCFuncPtr()
var f = CFunc<() -> Unit>(ptr) // 须确保指针指向有效函数地址

// CFunc → CPointer<T>
foreign func rand(): Int32
var p = CPointer<Int8>(rand) // 安全，但不应对转换后的指针 read/write
```
