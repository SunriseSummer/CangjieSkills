<!-- cj-doc kind="guide-leaf" level="4" id="language.const.2-const-表达式" parent="language.const" -->
# 2. const 表达式

[← 编译期常量](index.md)

可在编译时求值的表达式，包括：
1. 数值类型、`Bool`、`Unit`、`Rune`、`String`（不包含插值字符串）的字面量
2. 所有元素都是 const 表达式的 `Array` 字面量（不能是 `Array` 类型，可以使用 `VArray` 类型）和元组字面量
3. `const` 变量、`const` 函数形参、`const` 函数中的局部变量
4. `const` 函数，包含使用 `const` 声明的函数名、符合 `const` 函数要求的 `lambda`、以及这些函数返回的函数表达式
5. `const` 函数调用（包含 `const` 构造函数），该函数的表达式必须是 const 表达式，所有实参必须都是 const 表达式
6. 所有参数都是 const 表达式的 `enum` 构造器调用，和无参数的 `enum` 构造器
7. 数值类型、`Bool`、`Unit`、`Rune`、`String` 类型的算术表达式、关系表达式、位运算表达式，所有操作数都必须是 const 表达式
8. `if`、`match`、`try`、`throw`、`return`、`is`、`as` — 这些表达式内的表达式必须都是 const 表达式
9. const 表达式的成员访问（不包含属性的访问），元组的索引访问
10. `const init` 和 `const` 函数中的 `this` 和 `super` 表达式
11. `const` 表达式的 `const` 实例成员函数调用，且所有实参必须都是 const 表达式

---
