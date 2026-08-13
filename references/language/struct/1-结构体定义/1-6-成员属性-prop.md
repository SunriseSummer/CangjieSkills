<!-- cj-doc kind="guide-leaf" level="5" id="language.struct.1-结构体定义.1-6-成员属性-prop" parent="language.struct.1-结构体定义" -->
# 1.6 成员属性（prop）

[← 1. 结构体定义](index.md)

- `prop name: Type { get() { ... } }` — 只读属性
- `mut prop name: Type { get() { ... } set(v) { ... } }` — 读写属性
- 实例属性通过实例访问，静态属性（`static prop`）通过类型名访问
- 属性的详细规则参见 [class](../../class/index.md) 第 4 节
