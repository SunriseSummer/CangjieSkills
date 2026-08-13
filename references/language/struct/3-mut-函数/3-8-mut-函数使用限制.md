<!-- cj-doc kind="guide-leaf" level="5" id="language.struct.3-mut-函数.3-8-mut-函数使用限制" parent="language.struct.3-mut-函数" -->
# 3.8 `mut` 函数使用限制

[← 3. `mut` 函数](index.md)

`struct Foo`：mut 函数使用限制。

### 规则 1：`let` 声明的结构体变量不能调用 `mut` 函数
```cangjie cjtest=syntax id=syntax-d1aa1b8cb5-1 form=unit
struct Foo {
    var x = 0
    public mut func f(): Unit { x += 1 }
}

main() {
    // let a = Foo()
    // a.f()    // 错误：a 是 let 声明的结构体
    var b = Foo()
    b.f()    // 正确：b 是 var
}
```

### 规则 2：结构体类型变量上的 `mut` 函数不能作为一等公民使用
```cangjie cjtest=syntax id=syntax-d1aa1b8cb5-2 form=unit
interface I {
    mut func f(): Unit
}
struct Foo <: I {
    var x = 0
    public mut func f(): Unit { x += 1 }
}

main() {
    // var a = Foo()
    // var fn = a.f    // 错误：不能将 mut 函数作为一等公民使用
    var b: I = Foo()
    var fn = b.f       // 正确：b 是接口类型
}
```

### 规则 3：非 `mut` 实例成员函数不能调用 `mut` 函数；`mut` 函数**可以**调用非 `mut` 函数
```cangjie cjtest=syntax id=syntax-d1aa1b8cb5-3 form=unit
struct Foo {
    var i = 0
    public mut func f(): Unit {
        i += 1
        g()     // 正确：mut 可调用非 mut
    }
    public func g(): Unit {
        // f()  // 错误：非 mut 不能调用 mut
    }
}
```
