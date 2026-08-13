<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.setbit" parent="std.math.numeric.struct.bigint" -->
# BigInt.setBit

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func setBit(index: Int64): BigInt
```

通过将指定索引位置的 bit 修改为 1 来构造一个新 BigInt。

## 契约

参数：

- index: Int64 - 需要设置的 bit 位置的索引。`index` 需要大于等于 0。

返回值：

- BigInt - 一个新的 BigInt，它是将原 BigInt `index` 处的 bit 改为 1 的产物。

异常：

- IllegalArgumentException - 如果入参 `index` 小于 0，则抛此异常。
