<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.isprobableprime" parent="std.math.numeric.struct.bigint" -->
# BigInt.isProbablePrime

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func isProbablePrime(certainty: UInt64): Bool
```

判断一个数是不是素数。

## 契约

> **说明：**
>
> 该函数使用了 Miller-Rabin 测试算法，此算法的准确率会随着 certainty 参数的增加而增加。如果该数是素数，那么 Miller-Rabin 测试必定返回 true；如果该数是合数（期待返回 false），那么会有低于 1/4<sup>certainty</sup> 概率返回 true。素数只对大于等于 2 的正整数有意义，即负数，0，1 都不是素数。

参数：

- certainty: UInt64 - 需要执行 Miller-Rabin 测试的次数。注意，如果测试次数为 0，表示不测试，那么总是返回 true（即不是素数的数也必定返回 true）。

返回值：

- Bool - 如果使用此函数测定了一个数为素数，则返回 true；不为素数，则返回 false。
