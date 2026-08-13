<!-- cj-doc kind="guide-leaf" level="5" id="language.struct.3-mut-函数.3-5-mut-也可修饰运算符函数" parent="language.struct.3-mut-函数" -->
# 3.5 `mut` 也可修饰运算符函数

[← 3. `mut` 函数](index.md)

`struct A`：mut 也可修饰运算符函数。

```cangjie cjtest=syntax id=syntax-83cc05919c-1 form=unit
struct A {
    var x = 0
    public mut operator func +(rhs: A): A { A() }  // 合法
}
```
