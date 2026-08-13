<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.get" parent="std.core.struct.string" -->
# String.get

[← String](index.md)

## 签名

```cangjie role=signature
public func get(index: Int64): Option<Byte>
```

返回字符串下标 index 对应的 UTF-8 编码字节值。

## 契约

参数：

- index: Int64 - 要获取的字节值的下标。

返回值：

- Option\<Byte> - 获取得到下标对应的 UTF-8 编码字节值，当 index 小于 0 或者大于等于字符串长度，则返回 Option\<Byte>.None。
