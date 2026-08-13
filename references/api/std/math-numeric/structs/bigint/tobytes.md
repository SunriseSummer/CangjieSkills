<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.tobytes" parent="std.math.numeric.struct.bigint" -->
# BigInt.toBytes

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func toBytes(): Array<Byte>
```

计算并返回此 BigInt 的大端补码字节数组。

## 契约

字节数组最低索引的最低位为符号位，如 128 返回 [0, 128]（符号位为 0），-128 返回 [128]（符号位为 1）。

返回值：

- Array\<Byte> - 返回此 BigInt 的大端补码字节数组。
