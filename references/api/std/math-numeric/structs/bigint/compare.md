<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.compare" parent="std.math.numeric.struct.bigint" -->
# BigInt.compare

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func compare(that: BigInt): Ordering
```

判断 BigInt 与另一个 BigInt 的关系。

## 契约

参数：

- that: BigInt - 另一个 BigInt。

返回值：

- Ordering - 返回此 BigInt 与另一个 BigInt 的关系。如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT；如果大于，返回 Ordering.GT。
