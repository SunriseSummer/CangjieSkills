<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextgaussianfloat16" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextGaussianFloat16

[← SecureRandom](index.md)

## 签名

```cangjie role=signature
public func nextGaussianFloat16(mean!: Float16 = 0.0, sigma!: Float16 = 1.0): Float16
```

默认获取一个 Float16 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数，其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。

## 契约

参数：

- mean!: Float16 - 均值。
- sigma!: Float16 - 标准差。

返回值：

- Float16 - 一个 Float16 类型的随机数。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
