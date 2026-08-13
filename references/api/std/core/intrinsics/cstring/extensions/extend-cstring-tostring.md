<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.cstring.extension.extend-cstring-tostring" parent="std.core.intrinsic.cstring" -->
# extend CString <: ToString

[← CString](../index.md)

`extend CString <: ToString`

为 CString 类型扩展一些字符串指针常用方法，包括判空、获取长度、判等、获取子串等。

## 成员

| 签名 | 功能 |
|---|---|
| [`asResource(): CStringResource`](../asresource.md) | 获取当前 CString 实例对应的 CStringResource C 字符串资源类型实例。 |
| [`compare(str: CString): Int32`](../compare.md) | 按字典序比较两个字符串，同 C 语言中的 `strcmp`。 |
| [`endsWith(suffix: CString): Bool`](../endswith.md) | 判断字符串是否包含指定后缀。 |
| [`equals(rhs: CString): Bool`](../equals.md) | 判断两个字符串是否相等。 |
| [`equalsLower(rhs: CString): Bool`](../equalslower.md) | 判断两个字符串是否相等，忽略大小写。 |
| [`getChars(): CPointer<UInt8>`](../getchars.md) | 获取该字符串的指针。 |
| [`isEmpty(): Bool`](../isempty.md) | 判断字符串是否为空字符串。 |
| [`isNotEmpty(): Bool`](../isnotempty.md) | 判断字符串是否不为空字符串。 |
| [`isNull(): Bool`](../isnull.md) | 判断字符串指针是否为空。 |
| [`size(): Int64`](../size.md) | 返回该字符串长度，同 C 语言中的 `strlen`。 |
| [`startsWith(prefix: CString): Bool`](../startswith.md) | 判断字符串是否包含指定前缀。 |
| [`subCString(beginIndex: UIntNative): CString`](../subcstring.md) | 截取指定位置开始至字符串结束的子串。 |
| [`subCString(beginIndex: UIntNative, subLen: UIntNative): CString`](../subcstring.md) | 截取字符串的子串，指定起始位置和截取长度。 |
| [`toString(): String`](../tostring.md) | 将 CString 类型转为仓颉的 String 类型。 |
