<!-- cj-doc kind="guide-leaf" level="5" id="language.struct.3-mut-函数.3-4-mut-不能修饰静态函数" parent="language.struct.3-mut-函数" -->
# 3.4 `mut` 不能修饰静态函数

[← 3. `mut` 函数](index.md)

`public mut static func g(): Unit {} // 错误`：mut 不能修饰静态函数。

```cangjie cjtest=syntax id=syntax-bc9cddb41d-1 form=unit
public mut static func g(): Unit {} // 错误
```
