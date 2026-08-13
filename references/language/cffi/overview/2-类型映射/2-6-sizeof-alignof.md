<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.2-类型映射.2-6-sizeof-alignof" parent="language.cffi.overview.2-类型映射" -->
# 2.6 sizeOf / alignOf

[← 2. 类型映射](index.md)

获取 `CType` 类型的内存大小和对齐值（单位：字节）：

```cangjie cjtest=syntax id=syntax-204992f59a-1 form=stmt
@C
struct Data {
    var a: Int64 = 0
    var b: Float32 = 0.0
}

main() {
    println(sizeOf<Data>())    // 16（64 位机器）
    println(alignOf<Data>())   // 8（64 位机器）
    println(sizeOf<Int32>())   // 4
}
```
