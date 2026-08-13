<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.randomprobableprime" parent="std.math.numeric.struct.bigint" -->
# BigInt.randomProbablePrime

[← BigInt](index.md)

## 签名

```cangjie role=signature
public static func randomProbablePrime(bitLen: Int64, certainty: UInt64, rand!: Random = Random()): BigInt
```

通过可选的随机数种子构建一个随机的 BigInt 素数，素数的 bit 长度不超过入参 `bitLen`。

## 契约

显然，素数必定是大于等于 2 的整数，因此 `bitLen` 必须大于等于 2。素数检测使用 Miller-Rabin 素数测试算法。Miller-Rabin 测试会有概率将一个合数判定为素数，其出错概率随着入参 `certainty` 的增加而减少。

参数：

- bitLen: Int64 - 所要生成的随机素数的 bit 长度的上限。
- certainty: UInt64 - 生成的随机素数通过 Miller-Rabin 素数测试算法的次数，通过的次数越多，将合数误判为素数的概率越低。
- rand!: Random - 指定的随机数种子。

返回值：

- BigInt - 返回生成的随机素数。

异常：

- IllegalArgumentException - 如果指定的 bit 长度小于等于 1，则抛此异常。
