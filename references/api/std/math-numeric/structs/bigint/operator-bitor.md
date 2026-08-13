<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.operator-bitor" parent="std.math.numeric.struct.bigint" -->
# BigInt.|

[← BigInt](index.md)

## 签名

```cangjie role=signature
public operator func |(that: BigInt): BigInt
```

按位或。

## 契约

功能：按位或。其功能是参与运算的两数各对应的二进位相或。只有对应的两个二进位都为 0 时，结果位才为 0。

参数：

- that: BigInt - 按位或运算的另外一个 BigInt。

返回值：

- BigInt - 返回与另一个 BigInt 的按位或的结果。
