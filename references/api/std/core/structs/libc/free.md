<!-- cj-doc kind="api-member" level="6" id="std.core.struct.libc.free" parent="std.core.struct.libc" -->
# LibC.free

[← LibC](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func free(CString)

### 签名

```cangjie role=signature
public unsafe static  func free(cstr: CString): Unit
```

释放 C 风格字符串。

### 契约

参数：

- cstr: CString - 需要释放的 C 风格字符串。

## static func free<T>(CPointer<T>) where T <: CType

### 签名

```cangjie role=signature
public unsafe static  func free<T>(p: CPointer<T>): Unit where T <: CType
```

释放指针 p 指向的堆内存。

### 契约

参数：

- p: CPointer\<T> - 表示需要被释放的内存地址。
