<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.2-类型映射.2-3-cpointer-指针" parent="language.cffi.overview.2-类型映射" -->
# 2.3 CPointer\<T> 指针

[← 2. 类型映射](index.md)

`CPointer<T>` 映射到 C 的 `T*` 类型，`T` 须满足 `CType` 约束。

核心 API：

| 方法 | 说明 | 是否 unsafe |
|------|------|------------|
| `CPointer<T>()` | 创建空指针 | 否 |
| `isNull()` / `isNotNull()` | 判空 | 否 |
| `read()` | 读取指针指向的值 | 是 |
| `read(idx: Int64)` | 读取偏移 idx 处的值 | 是 |
| `write(value: T)` | 写入值到指针位置 | 是 |
| `write(idx: Int64, value: T)` | 写入值到偏移 idx 处 | 是 |
| `+ (offset: Int64)` | 指针偏移 | 是 |
| `- (offset: Int64)` | 指针偏移 | 是 |
| `toUIntNative()` | 转为整型地址值 | 否 |
| `asResource()` | 转为 `CPointerResource<T>` 自动管理 | 否 |

```cangjie cjtest=syntax id=syntax-292e57d536-1 form=unit
foreign func malloc(size: UIntNative): CPointer<Unit>
foreign func free(ptr: CPointer<Unit>): Unit

@C
struct Point {
    var x: Int64 = 0
    var y: Int64 = 0
    init(x: Int64, y: Int64) {
        this.x = x
        this.y = y
    }
}

main() {
    let p1 = CPointer<Point>()       // 空指针
    println(p1.isNull())              // true

    var p2 = unsafe { malloc(16) }    // 分配堆内存
    var p3 = unsafe { CPointer<Point>(p2) }  // 指针类型转换

    unsafe { p3.write(Point(1, 2)) }  // 写入数据
    let pt = unsafe { p3.read() }     // 读取数据
    println("${pt.x}, ${pt.y}")       // 1, 2

    let p4 = unsafe { p3 + 1 }        // 指针偏移

    unsafe { free(p2) }               // 释放内存
}
```

指针类型转换（泛型参数 `T` 均须满足 `CType`）：

```cangjie cjtest=syntax id=syntax-292e57d536-2 form=stmt
var pInt8 = CPointer<Int8>()
var pUInt8 = CPointer<UInt8>(pInt8)  // CPointer<Int8> → CPointer<UInt8>
```
