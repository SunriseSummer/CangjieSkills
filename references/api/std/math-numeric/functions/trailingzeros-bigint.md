<!-- cj-doc kind="api-member" level="5" id="std.math.numeric.func.trailingzeros-bigint" parent="std.math.numeric" -->
# trailingZeros(BigInt)

[← std.math.numeric](../index.md)

## 签名

```cangjie role=signature
public func trailingZeros(x: BigInt): Int64
```

求 `BigInt` 的二进制表达中的从最低位算起，连续位为 0 的个数。

## 契约

功能：求 `BigInt` 的二进制表达中的从最低位算起，连续位为 0 的个数。如果最低位不是 0，则返回 0。

参数：

- x: BigInt - 需要求后置 0 的 BigInt。

返回值：

- Int64 - 后置 0 的位数。
