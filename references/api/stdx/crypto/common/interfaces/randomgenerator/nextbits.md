<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.randomgenerator.nextbits" parent="stdx.crypto.common.interface.randomgenerator" -->
# RandomGenerator.nextBits

[← RandomGenerator](index.md)

## 签名

```cangjie role=signature
public func nextBits(bits: UInt64): UInt64
```

生成一个指定位长的随机整数。

## 参数

- bits: UInt64 - 要生成的随机数的位数，取值范围 (0, 64]。

## 返回值

- UInt64 - 生成的指定位长的随机数。

