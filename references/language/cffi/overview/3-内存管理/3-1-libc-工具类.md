<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.3-内存管理.3-1-libc-工具类" parent="language.cffi.overview.3-内存管理" -->
# 3.1 LibC 工具类

[← 3. 内存管理](index.md)

`LibC` 提供 C 互操作的内存分配和释放（所有方法均须在 `unsafe` 上下文中调用）：

| 方法 | 说明 |
|------|------|
| `malloc<T>(count!: Int64 = 1): CPointer<T>` | 分配 `sizeOf<T>() * count` 字节的堆内存 |
| `free<T>(p: CPointer<T>): Unit` | 释放 `CPointer<T>` 指向的内存 |
| `mallocCString(str: String): CString` | 将仓颉 `String` 转为堆分配的 `CString` |
| `free(cstr: CString): Unit` | 释放 `CString` 内存 |

```cangjie cjtest=syntax id=syntax-e8769ae694-1 form=stmt
@C
struct Point {
    var x: Int64 = 0
    var y: Int64 = 0
}

main() {
    // 分配单个结构体
    let p = unsafe { LibC.malloc<Point>() }
    unsafe {
        p.write(Point())
        println(p.read().x)
        LibC.free(p)
    }

    // 分配数组（5 个 Int32）
    let arr = unsafe { LibC.malloc<Int32>(count: 5) }
    unsafe {
        for (i in 0..5) { arr.write(i, Int32(i * 10)) }
        for (i in 0..5) { print("${arr.read(i)} ") }  // 0 10 20 30 40
        println()
        LibC.free(arr)
    }
}
```
