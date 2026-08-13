<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.2-类型映射.2-7-ctype-接口" parent="language.cffi.overview.2-类型映射" -->
# 2.7 CType 接口

[← 2. 类型映射](index.md)

`CType` 是空接口，作为所有 C 互操作类型的父类型，用于泛型约束。不能被继承或扩展。

```cangjie cjtest=syntax id=syntax-0ce4ae129b-1 form=unit
func processAny<T>(x: T): Unit where T <: CType {
    match (x) {
        case i: Int32 => println("Int32: ${i}")
        case p: CPointer<Int8> => println("pointer isNull: ${p.isNull()}")
        case f: CFunc<() -> Unit> => unsafe { f() }
        case _ => println("other CType")
    }
}
```

---
