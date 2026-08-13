<!-- cj-doc kind="guide-topic" level="3" id="language.basic_concepts" parent="language" -->
# 基本概念

[← 语言特性](../index.md)

关键字、标识符、变量、作用域、表达式、控制流、函数与程序结构。

| 规则/任务 | 摘要 |
|---|---|
| [0. 关键字](0-关键字.md) | 类型关键字：`Bool`、`Rune`、`Float16`、`Float32`、`Float64`、`Int8`、`Int16`、`Int32`、`Int64`、`IntNative`、`UInt8`、`UInt16`、`UInt32`、`UInt64`、`UIntNative`、`VArray`、`Nothing`、`Unit` |
| [1. 标识符](1-标识符/index.md) | 以 `XID_Start` 字符（包括中英文字母）开头，后跟 `XID_Continue` 字符；或以 `_` 开头后跟至少一个 `XID_Continue` 字符 |
| [2. 程序结构](2-程序结构/index.md) | 注意：`Array` 是用 `struct` 定义的，但把数组数据存放在托管内存中（结构体中一个引用类型成员），赋值后两个变量共享底层存储，修改互相可见 |
| [3. 表达式](3-表达式/index.md) | 仓颉中所有可求值的程序元素都是表达式，包括算术表达式和 if/match 等复合表达式 |
| [4. 函数（基本概念）](4-函数-基本概念.md) | 使用 `func name(params): ReturnType { exprs }` 定义 |
| [5. 创建、编译和运行仓颉项目](5-创建-编译和运行仓颉项目.md) | 创建项目：`cjpm init` |
