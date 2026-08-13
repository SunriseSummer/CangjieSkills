<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextgaussianfloat16" parent="std.random.class.random" -->
# Random.nextGaussianFloat16

[← Random](index.md)

## 签名

```cangjie role=signature
public func nextGaussianFloat16(mean!: Float16 = 0.0, sigma!: Float16 = 1.0): Float16
```

获取一个 Float16 类型的符合指定均值与标准差的高斯分布的随机数。

## 契约

默认获取一个 Float16 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数。其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。

参数：

- mean!: Float16 - 均值，默认值 0.0。
- sigma!: Float16 - 标准差，默认值 1.0。

返回值：

- Float16 - 一个 Float16 类型的随机数。
