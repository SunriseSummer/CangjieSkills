<!-- cj-doc kind="guide-leaf" level="5" id="language.class.1-类定义.1-9-this-类型" parent="language.class.1-类定义" -->
# 1.9 `This` 类型

[← 1. 类定义](index.md)

- 在类内部，`This` 是当前类类型的占位符，仅可用作实例方法返回类型
- 子类继承返回 `This` 的方法时，返回类型被识别为子类类型
- 若实例成员函数未声明返回类型且仅返回 `This` 类型表达式，返回类型推断为 `This`

---
