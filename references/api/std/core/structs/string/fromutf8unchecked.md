<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.fromutf8unchecked" parent="std.core.struct.string" -->
# String.fromUtf8Unchecked

[← String](index.md)

## 签名

```cangjie role=signature
public unsafe static  func fromUtf8Unchecked(utf8Data: Array<UInt8>): String
```

根据字节数组构造一个字符串。

## 契约

相较于 fromUtf8 函数，fromUtf8Unchecked 并没有针对于字节数组进行 UTF-8 相关规则的检查，所以它所构建的字符串并不一定保证是合法的，甚至出现非预期的异常，如果不是某些场景下的性能考虑，请优先使用安全的 fromUtf8 函数。

参数：

- utf8Data: Array\<UInt8> - 根据该字节数组构造字符串。

返回值：

- String - 构造的字符串。

异常：

- IllegalArgumentException - 当试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。
