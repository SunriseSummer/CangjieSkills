<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.2-类型映射.2-5-cstring-字符串" parent="language.cffi.overview.2-类型映射" -->
# 2.5 CString 字符串

[← 2. 类型映射](index.md)

`CString` 对应 C 的 `char*` 字符串，由 `LibC.mallocCString()` 创建，使用后须通过 `LibC.free()` 释放。

核心 API：

| 方法 | 说明 |
|------|------|
| `size(): Int64` | 字符串长度 |
| `isEmpty()` / `isNotEmpty()` | 长度判断（指针为 null 时 isEmpty 返回 true） |
| `isNull(): Bool` | 判断指针是否为 null |
| `getChars(): CPointer<UInt8>` | 获取底层字符数组指针 |
| `equals(rhs: CString): Bool` | 相等比较 |
| `equalsLower(rhs: CString): Bool` | 忽略大小写比较 |
| `compare(str: CString): Int32` | 字典序比较（同 C 的 `strcmp`） |
| `startsWith(str: CString): Bool` | 前缀判断 |
| `endsWith(str: CString): Bool` | 后缀判断 |
| `subCString(start: UInt64): CString` | 截取子串（新分配空间） |
| `subCString(start: UInt64, len: UInt64): CString` | 截取指定长度子串 |
| `toString(): String` | 转为仓颉 `String` |
| `asResource(): CStringResource` | 转为自动管理的 Resource |

```cangjie cjtest=syntax id=syntax-13e9c46cd0-1 form=unit
foreign func strlen(s: CString): UIntNative

main() {
    var s = unsafe { LibC.mallocCString("hello") }

    println(s.size())              // 5
    println(s.isEmpty())           // false
    println(s.toString())          // hello

    let len = unsafe { strlen(s) } // 调用 C 的 strlen
    println(len)                   // 5

    unsafe { LibC.free(s) }        // 须手动释放
}
```

**CString 与 C 代码交互的完整示例：**

```c
// C 侧
char *str = "CString in C code.";
char *getCString() { return str; }
void printCString(char *s) { printf("%s\n", s); }
```

```cangjie cjtest=syntax id=syntax-13e9c46cd0-2 form=unit
foreign func getCString(): CString
foreign func printCString(s: CString): Unit

main() {
    // 仓颉 → C：构造 CString 传给 C 函数
    unsafe {
        let s = LibC.mallocCString("CString in Cangjie code.")
        printCString(s)
        LibC.free(s)
    }

    // C → 仓颉：获取 C 字符串转为仓颉 String
    unsafe {
        let cs = getCString()
        println(cs.toString())  // "CString in C code."
    }

    // 使用 CStringResource 自动管理内存
    let cs = unsafe { LibC.mallocCString("auto managed") }
    try (csr = cs.asResource()) {
        unsafe { printCString(csr.value) }
    }  // 离开 try 块时自动释放
}
```
