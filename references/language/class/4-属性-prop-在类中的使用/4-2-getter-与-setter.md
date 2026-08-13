<!-- cj-doc kind="guide-leaf" level="5" id="language.class.4-属性-prop-在类中的使用.4-2-getter-与-setter" parent="language.class.4-属性-prop-在类中的使用" -->
# 4.2 getter 与 setter

[← 4. 属性（prop）在类中的使用](index.md)

- **getter**：`() -> T` — 读取属性时执行
- **setter**：`(T) -> Unit` — 属性被赋值时执行
- 在 getter/setter 内部访问属性本身 = 递归调用
