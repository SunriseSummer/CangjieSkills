<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.operator-bitand" parent="std.math.numeric.struct.bigint" -->
# BigInt.&

[← BigInt](index.md)

## 签名

```cangjie role=signature
public operator func &(that: BigInt): BigInt
```

按位与。

## 契约

功能：按位与。其功能是参与运算的两数各对应的二进位相与。只有对应的两个二进位都为 1 时，结果位才为 1。

参数：

- that: BigInt - 按位与运算的另外一个 BigInt。

返回值：

- BigInt - 返回与另一个 BigInt 的按位与的结果。
