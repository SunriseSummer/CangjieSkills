<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.rawdata" parent="std.core.struct.string" -->
# String.rawData

[← String](index.md)

## 签名

```cangjie role=signature
public unsafe func rawData(): Array<Byte>
```

获取字符串的 UTF-8 编码的原始字节数组。

## 契约

> **注意：**
>
> 用户不应该对获取的数组进行修改，这将破坏字符串的不可变性。

返回值：

- Array\<Byte> - 当前字符串对应的原始字节数组。
