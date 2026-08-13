<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.modinverse" parent="std.math.numeric.struct.bigint" -->
# BigInt.modInverse

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func modInverse(that: BigInt): BigInt
```

求模逆元。

## 契约

模逆元 r 满足 $(this * r) \% that == 1$。显然，`this` 和 `that` 必须互质。当 `that` 为 正负 1 时，结果总是 0。

参数：

- that: BigInt - 另外一个 BigInt。入参不得为 0，且需要与 `this` 互质。

返回值：

- BigInt - 返回模逆元。

异常：

- IllegalArgumentException - 当 `this` 和 `that` 不互质或 `that` 为 0 时，抛此异常。
