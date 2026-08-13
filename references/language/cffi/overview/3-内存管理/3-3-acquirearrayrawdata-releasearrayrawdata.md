<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.3-内存管理.3-3-acquirearrayrawdata-releasearrayrawdata" parent="language.cffi.overview.3-内存管理" -->
# 3.3 acquireArrayRawData / releaseArrayRawData

[← 3. 内存管理](index.md)

将仓颉 `Array<T>` 的底层数据暴露为 `CPointer<T>` 传递给 C 函数，无需拷贝：

```cangjie cjtest=syntax id=syntax-85fc0eb2e4-1 form=unit
// 函数签名
public unsafe func acquireArrayRawData<T>(arr: Array<T>): CPointerHandle<T> where T <: CType
public unsafe func releaseArrayRawData<T>(handle: CPointerHandle<T>): Unit where T <: CType
```

```cangjie cjtest=syntax id=syntax-85fc0eb2e4-2 form=unit
foreign func processBuffer(buf: CPointer<Int64>, len: Int32): Unit

main() {
    var arr: Array<Int64> = [1, 2, 3, 4, 5]
    unsafe {
        var handle = acquireArrayRawData(arr)
        processBuffer(handle.pointer, Int32(arr.size))  // 直接传底层指针
        releaseArrayRawData(handle)  // 必须配对释放
    }
}
```

> **注意：** `acquireArrayRawData` 和 `releaseArrayRawData` 必须配对使用。在两者之间不应构造仓颉对象或执行复杂逻辑，仅做简单的 C 函数调用。

---
