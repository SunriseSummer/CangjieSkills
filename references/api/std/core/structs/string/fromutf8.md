<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.fromutf8" parent="std.core.struct.string" -->
# String.fromUtf8

[← String](index.md)

## 签名

```cangjie role=signature
public static func fromUtf8(utf8Data: Array<UInt8>): String
```

根据 UTF-8 编码的字节数组构造一个字符串。

## 契约

参数：

- utf8Data: Array\<UInt8> - 根据该字节数组构造字符串。

返回值：

- String - 构造的字符串。

异常：

- IllegalArgumentException - 入参不符合 utf-8 序列规则，或者试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。
