<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.operator-bitxor" parent="std.math.numeric.struct.bigint" -->
# BigInt.^

[← BigInt](index.md)

## 签名

```cangjie role=signature
public operator func ^(that: BigInt): BigInt
```

按位异或。

## 契约

功能：按位异或。其功能是参与运算的两数各对应的二进位相异或。二进制位结果不相同时，异或结果为 1；二进制位结果相同时，异或结果为 0。

参数：

- that: BigInt - 按位异或运算的另外一个 BigInt。

返回值：

- BigInt - 返回与另一个 BigInt 的按位异或的结果。
