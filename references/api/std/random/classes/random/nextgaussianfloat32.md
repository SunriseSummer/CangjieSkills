<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextgaussianfloat32" parent="std.random.class.random" -->
# Random.nextGaussianFloat32

[← Random](index.md)

## 签名

```cangjie role=signature
public func nextGaussianFloat32(mean!: Float32 = 0.0, sigma!: Float32 = 1.0): Float32
```

获取一个 Float32 类型的符合指定均值与标准差的高斯分布的随机数。

## 契约

默认获取一个 Float32 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数。其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。

参数：

- mean!: Float32 - 均值，默认值 0.0。
- sigma!: Float32 - 标准差，默认值 1.0。

返回值：

- Float32 - 一个 Float32 类型的随机数。
