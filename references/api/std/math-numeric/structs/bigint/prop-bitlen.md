<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.prop-bitlen" parent="std.math.numeric.struct.bigint" -->
# BigInt.bitLen

[← BigInt](index.md)

## 签名

```cangjie role=signature
public prop bitLen: Int64
```

获取此 BigInt 的最短 bit 长度。

## 契约

功能：获取此 BigInt 的最短 bit 长度。如 -3 (101) 返回 3，-1 (11) 返回 2，0 (0) 返回 1。

类型：Int64
