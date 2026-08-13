<!-- cj-doc kind="api-member" level="6" id="std.core.struct.libc.malloccstring" parent="std.core.struct.libc" -->
# LibC.mallocCString

[← LibC](index.md)

## 签名

```cangjie role=signature
public unsafe static  func mallocCString(str: String): CString
```

通过 String 申请与之字符内容相同的 C 风格字符串。

## 契约

构造的 C 风格字符串将以 '\0' 结束。当异常场景如系统内存不足时，返回字符串指针可能为空，故使用前需要进行空指针检查。

参数：

- str: String - 根据该仓颉字符串构造 C 字符串。

返回值：

- CString - 新构造的 C 风格字符串。

异常：

- IllegalMemoryException - 内存不足时，抛出异常。
