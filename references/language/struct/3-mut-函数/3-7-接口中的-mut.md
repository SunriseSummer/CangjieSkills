<!-- cj-doc kind="guide-leaf" level="5" id="language.struct.3-mut-函数.3-7-接口中的-mut" parent="language.struct.3-mut-函数" -->
# 3.7 接口中的 `mut`

[← 3. `mut` 函数](index.md)

- 接口函数可声明为 `mut`
- **结构体**实现接口时须**精确匹配** `mut` 修饰符（mut↔mut, 非mut↔非mut）
- **类**实现接口时**忽略** `mut`（直接使用普通 `func`）
- 将结构体实例赋给接口类型变量时会**复制**。通过接口变量调用 `mut` 函数修改的是副本，**不影响**原始结构体
