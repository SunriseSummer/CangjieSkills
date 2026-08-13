<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.securerandom.nextgaussianfloat32" parent="stdx.crypto.crypto.class.securerandom" -->
# SecureRandom.nextGaussianFloat32

[← SecureRandom](index.md)

## 签名

```cangjie role=signature
public func nextGaussianFloat32(mean!: Float32 = 0.0, sigma!: Float32 = 1.0): Float32
```

默认获取一个 Float32 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数，其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。

## 契约

参数：

- mean!: Float32 - 均值。
- sigma!: Float32 - 标准差。

返回值：

- Float32 - 一个 Float32 类型的随机数。

异常：

- SecureRandomException - 当生成器不能正确生成随机数或生成随机数失败时，抛出异常。
