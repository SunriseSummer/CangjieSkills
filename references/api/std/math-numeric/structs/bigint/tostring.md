<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.tostring" parent="std.math.numeric.struct.bigint" -->
# BigInt.toString

[← BigInt](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func toString()

### 签名

```cangjie role=signature
public func toString(): String
```

计算并返回此 BigInt 的十进制字符串表示。

### 契约

返回值：

- String - 返回此 BigInt 的十进制字符串。

## func toString(Int64)

适用扩展：[extend BigInt <: RadixConvertible<BigInt>](extensions/extend-bigint-radixconvertible-bigint.md)。

### 签名

```cangjie role=signature
public func toString(radix!: Int64): String
```

计算并返回此 BigInt 的任意进制字符串表示。

### 契约

参数：

- radix!: Int64 - 进制。字符串所表示的进制，范围为 [2, 36]。

返回值：

- String - 返回此 BigInt 的 `radix` 进制字符串。

异常：

- IllegalArgumentException - 当入参 radix 不在 [2, 36] 范围内时，抛出异常。
