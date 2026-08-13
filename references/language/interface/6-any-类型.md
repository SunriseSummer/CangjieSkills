<!-- cj-doc kind="guide-leaf" level="4" id="language.interface.6-any-类型" parent="language.interface" -->
# 6. `Any` 类型

[← 接口](index.md)

- 内置接口：`interface Any {}`
- 所有接口默认继承 `Any`；所有非接口类型默认实现 `Any`
- 每个类型都是 `Any` 的子类型
```cangjie cjtest=syntax id=syntax-151c7fed4b-1 form=unit
main() {
    var any: Any = 1
    any = 2.0
    any = "hello, world!"
}
```

---
