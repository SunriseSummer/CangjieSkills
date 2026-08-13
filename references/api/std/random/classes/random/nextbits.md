<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextbits" parent="std.random.class.random" -->
# Random.nextBits

[← Random](index.md)

## 签名

```cangjie role=signature
public func nextBits(bits: UInt64): UInt64
```

生成一个指定位长的随机整数。

## 契约

参数：

- bits: UInt64 - 要生成的伪随机数的位数，取值范围 (0, 64]。

返回值：

- UInt64 - 生成的用户指定位长的伪随机数。

异常：

- IllegalArgumentException - 如果 `bits` 等于 0，或大于 64，超过所能截取的 UInt64 长度，则抛出异常。
