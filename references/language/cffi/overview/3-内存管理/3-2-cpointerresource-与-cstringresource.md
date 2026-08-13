<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.3-内存管理.3-2-cpointerresource-与-cstringresource" parent="language.cffi.overview.3-内存管理" -->
# 3.2 CPointerResource 与 CStringResource

[← 3. 内存管理](index.md)

使用 `try-with-resource` 语法自动管理内存，避免手动释放：

```cangjie cjtest=syntax id=syntax-f864b428df-1 form=unit
main() {
    // CPointerResource：自动释放 CPointer
    let p = unsafe { LibC.malloc<Int32>() }
    try (res = p.asResource()) {
        unsafe { res.value.write(42) }
        println(unsafe { res.value.read() })  // 42
    }  // 离开 try 块时自动调用 LibC.free

    // CStringResource：自动释放 CString
    let cs = unsafe { LibC.mallocCString("hello") }
    try (csr = cs.asResource()) {
        println(csr.value.toString())  // hello
    }  // 离开 try 块时自动调用 LibC.free
}
```
