<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.iterator" parent="std.core.struct.string" -->
# String.iterator

[← String](index.md)

## 签名

```cangjie role=signature
public func iterator(): Iterator<Byte>
```

获取字符串的 UTF-8 编码字节迭代器，可用于支持 for-in 循环。

## 契约

返回值：

- Iterator\<Byte> - 字符串的 UTF-8 编码字节迭代器。
